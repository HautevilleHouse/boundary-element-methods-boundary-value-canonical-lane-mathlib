import canonicalLaneMathlib.AdmissibleClass

/-!
# Boundary Integral Formulation Package
-/

namespace HautevilleHouse
namespace BoundaryElementMethodsBoundaryValueCanonicalLaneLean

structure BoundaryIntegralFormulationPackage
    {P : BoundaryPotentialEquationPackage} where
  boundaryIntegralOperator : Type u
  discretizationSpace : Type v
  coercivityCondition : Prop
  infSupCondition : Prop
  approximationProperty : Prop

structure BoundaryIntegralFormulationEvidence
    {P : BoundaryPotentialEquationPackage}
    (F : BoundaryIntegralFormulationPackage P) where
  coercivityConditionClosed : F.coercivityCondition
  infSupConditionClosed : F.infSupCondition
  approximationPropertyClosed : F.approximationProperty

def BoundaryIntegralFormulationClosed
    {P : BoundaryPotentialEquationPackage}
    (F : BoundaryIntegralFormulationPackage P) : Prop :=
  F.coercivityCondition ∧ F.infSupCondition ∧ F.approximationProperty

theorem boundary_integral_formulation_closed_from_evidence
    {P : BoundaryPotentialEquationPackage}
    (F : BoundaryIntegralFormulationPackage P)
    (E : BoundaryIntegralFormulationEvidence F) :
    BoundaryIntegralFormulationClosed F := by
  exact And.intro E.coercivityConditionClosed
    (And.intro E.infSupConditionClosed E.approximationPropertyClosed)

end BoundaryElementMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse