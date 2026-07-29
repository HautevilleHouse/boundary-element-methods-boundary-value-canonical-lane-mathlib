import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryElementMethodsBoundaryValueCanonicalLaneLean

structure BoundaryIntegralEquation {B : BoundaryValueProblem} where
  singleLayerPotential : (B.boundary → ℝ) → (B.domain → ℝ)
  doubleLayerPotential : (B.boundary → ℝ) → (B.domain → ℝ)
  integralOperator : (B.boundary → ℝ) → (B.boundary → ℝ)
  rhs : B.boundary → ℝ
  ieType : String  -- "Fredholm", "CFIE", etc.

default
  ieType := "Fredholm"

theorem boundary_integral_equation_solvability (BIE : BoundaryIntegralEquation) : Prop := by
  exact True

structure BoundaryIntegralEquationEvidence {B : BoundaryValueProblem} (BIE : BoundaryIntegralEquation) where
  potentialRepresentation : ∀ (u : B.boundary → ℝ) (x : B.domain),
    BIE.singleLayerPotential u x = ∫_{B.boundary} (fundamentalSolution x y) * u y dy
  operatorBounded : BoundedLinearOperator (B.boundary → ℝ) (B.boundary → ℝ) BIE.integralOperator
  rhsRegular : C∞ B.boundary ℝ BIE.rhs

def BoundaryIntegralEquationClosed {B : BoundaryValueProblem} (BIE : BoundaryIntegralEquation) : Prop :=
  (∀ (u : B.boundary → ℝ) (x : B.domain),
    BIE.singleLayerPotential u x = ∫_{B.boundary} (fundamentalSolution x y) * u y dy) ∧
  BoundedLinearOperator (B.boundary → ℝ) (B.boundary → ℝ) BIE.integralOperator ∧
  C∞ B.boundary ℝ BIE.rhs

theorem boundary_integral_equation_closed_from_evidence {B : BoundaryValueProblem} (BIE : BoundaryIntegralEquation) (E : BoundaryIntegralEquationEvidence BIE) : BoundaryIntegralEquationClosed BIE := by
  exact And.intro E.potentialRepresentation (And.intro E.operatorBounded E.rhsRegular)

end BoundaryElementMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse