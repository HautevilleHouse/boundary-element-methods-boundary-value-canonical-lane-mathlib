import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryElementMethodsBoundaryValueCanonicalLaneLean

structure BoundaryIntegralOperatorPackage (G : PotentialTheoryPackage) where
  operatorKernel : Type u
  singleLayerPotential : Type v
  doubleLayerPotential : Type w
  hypersingularOperator : Type x
  kernelWellDefined : Prop
  potentialRelations : Prop

structure BoundaryIntegralOperatorEvidence {G : PotentialTheoryPackage}
    (F : BoundaryIntegralOperatorPackage G) where
  kernelWellDefinedClosed : F.kernelWellDefined
  potentialRelationsClosed : F.potentialRelations

def BoundaryIntegralOperatorClosed {G : PotentialTheoryPackage}
    (F : BoundaryIntegralOperatorPackage G) : Prop :=
  F.kernelWellDefined ∧ F.potentialRelations

theorem boundary_integral_operator_closed_from_evidence
    {G : PotentialTheoryPackage} (F : BoundaryIntegralOperatorPackage G)
    (E : BoundaryIntegralOperatorEvidence F) : BoundaryIntegralOperatorClosed F := by
  exact And.intro E.kernelWellDefinedClosed E.potentialRelationsClosed

end BoundaryElementMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse