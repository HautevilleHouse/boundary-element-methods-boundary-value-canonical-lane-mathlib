import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryElementMethodsBoundaryValueCanonicalLaneLean

structure BoundaryValueProblemPackage where
  domain : Type u
  boundary : Type v
  pde : Prop
  boundaryCondition : Prop
  solutionSpace : Prop

structure IntegralEquationPackage (B : BoundaryValueProblemPackage) where
  kernelFunction : Type w
  singleLayerPotential : Prop
  doubleLayerPotential : Prop
  boundaryIntegralOperator : Prop

structure PotentialTheoryPackage (B : BoundaryValueProblemPackage) (I : IntegralEquationPackage B) where
  layerPotentials : Prop
  jumpConditions : Prop
  mappingProperties : Prop

structure BoundaryElementPackage (B : BoundaryValueProblemPackage) (I : IntegralEquationPackage B) (P : PotentialTheoryPackage B I) where
  mesh : Type
  basisFunctions : Type
  quadrature : Prop
  algebraicSystem : Prop

structure BoundaryIntegralOperatorsPackage (B : BoundaryValueProblemPackage) (I : IntegralEquationPackage B) (P : PotentialTheoryPackage B I) (E : BoundaryElementPackage B I P) where
  singleLayerOperator : Prop
  doubleLayerOperator : Prop
  adjointDoubleLayer : Prop
  hypersingularOperator : Prop
  operatorProperties : Prop

structure BoundaryIntegralOperatorsEvidence (B : BoundaryValueProblemPackage) (I : IntegralEquationPackage B) (P : PotentialTheoryPackage B I) (E : BoundaryElementPackage B I P) (O : BoundaryIntegralOperatorsPackage B I P E) where
  singleLayerOperatorClosed : O.singleLayerOperator
  doubleLayerOperatorClosed : O.doubleLayerOperator
  adjointDoubleLayerClosed : O.adjointDoubleLayer
  hypersingularOperatorClosed : O.hypersingularOperator
  operatorPropertiesClosed : O.operatorProperties

def BoundaryIntegralOperatorsClosed (B : BoundaryValueProblemPackage) (I : IntegralEquationPackage B) (P : PotentialTheoryPackage B I) (E : BoundaryElementPackage B I P) (O : BoundaryIntegralOperatorsPackage B I P E) : Prop :=
  O.singleLayerOperator ∧ O.doubleLayerOperator ∧ O.adjointDoubleLayer ∧ O.hypersingularOperator ∧ O.operatorProperties

theorem boundary_integral_operators_closed_from_evidence (B : BoundaryValueProblemPackage) (I : IntegralEquationPackage B) (P : PotentialTheoryPackage B I) (E : BoundaryElementPackage B I P) (O : BoundaryIntegralOperatorsPackage B I P E) (Ev : BoundaryIntegralOperatorsEvidence B I P E O) : BoundaryIntegralOperatorsClosed B I P E O := by
  exact And.intro Ev.singleLayerOperatorClosed (And.intro Ev.doubleLayerOperatorClosed (And.intro Ev.adjointDoubleLayerClosed (And.intro Ev.hypersingularOperatorClosed Ev.operatorPropertiesClosed)))

end BoundaryElementMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse