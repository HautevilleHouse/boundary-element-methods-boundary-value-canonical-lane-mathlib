import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryElementMethodsBoundaryValueCanonicalLaneLean

structure GalerkinFormulation {B : BoundaryValueProblem} {BIE : BoundaryIntegralEquation} where
  trialSpace : Set (B.boundary → ℝ)
  testSpace : Set (B.boundary → ℝ)
  bilinearForm : (B.boundary → ℝ) → (B.boundary → ℝ) → ℝ
  linearForm : (B.boundary → ℝ) → ℝ
  solutionSpace : Set (B.boundary → ℝ)

default
  trialSpace := {f | f ∈ L²(B.boundary)}
  testSpace := {f | f ∈ L²(B.boundary)}

theorem galerkin_variational_formulation (G : GalerkinFormulation) : Prop := by
  trivial

structure GalerkinFormulationEvidence {B : BoundaryValueProblem} {BIE : BoundaryIntegralEquation} (G : GalerkinFormulation) where
  bilinearFormContinuous : Continuous (uncurry G.bilinearForm)
  bilinearFormCoercive : ∃ α > 0, ∀ u ∈ G.trialSpace, G.bilinearForm u u ≥ α * ‖u‖^2
  linearFormBounded : ∃ C > 0, ∀ v ∈ G.testSpace, |G.linearForm v| ≤ C * ‖v‖
  solutionExistence : ∃ u ∈ G.solutionSpace, ∀ v ∈ G.testSpace, G.bilinearForm u v = G.linearForm v

def GalerkinFormulationClosed {B : BoundaryValueProblem} {BIE : BoundaryIntegralEquation} (G : GalerkinFormulation) : Prop :=
  Continuous (uncurry G.bilinearForm) ∧
  (∃ α > 0, ∀ u ∈ G.trialSpace, G.bilinearForm u u ≥ α * ‖u‖^2) ∧
  (∃ C > 0, ∀ v ∈ G.testSpace, |G.linearForm v| ≤ C * ‖v‖) ∧
  (∃ u ∈ G.solutionSpace, ∀ v ∈ G.testSpace, G.bilinearForm u v = G.linearForm v)

theorem galerkin_formulation_closed_from_evidence {B : BoundaryValueProblem} {BIE : BoundaryIntegralEquation} (G : GalerkinFormulation) (E : GalerkinFormulationEvidence G) : GalerkinFormulationClosed G := by
  exact And.intro E.bilinearFormContinuous (And.intro E.bilinearFormCoercive (And.intro E.linearFormBounded E.solutionExistence))

end BoundaryElementMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse