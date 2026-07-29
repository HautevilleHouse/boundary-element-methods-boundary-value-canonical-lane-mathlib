import canonicalLaneMathlib.AdmissibleClass

/-!
# Boundary Potential Equation Package
-/

namespace HautevilleHouse
namespace BoundaryElementMethodsBoundaryValueCanonicalLaneLean

structure BoundaryPotentialEquationPackage where
  domainType : Type u
  boundaryType : Type v
  kernelFunction : Type w
  potentialOperator : Type x
  integralEquation : Prop
  uniquenessCondition : Prop
  existenceCondition : Prop

structure BoundaryPotentialEquationEvidence
    (P : BoundaryPotentialEquationPackage) where
  integralEquationClosed : P.integralEquation
  uniquenessConditionClosed : P.uniquenessCondition
  existenceConditionClosed : P.existenceCondition

def BoundaryPotentialEquationClosed (P : BoundaryPotentialEquationPackage) : Prop :=
  P.integralEquation ∧ P.uniquenessCondition ∧ P.existenceCondition

theorem boundary_potential_equation_closed_from_evidence
    (P : BoundaryPotentialEquationPackage)
    (E : BoundaryPotentialEquationEvidence P) :
    BoundaryPotentialEquationClosed P := by
  exact And.intro E.integralEquationClosed
    (And.intro E.uniquenessConditionClosed E.existenceConditionClosed)

end BoundaryElementMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse