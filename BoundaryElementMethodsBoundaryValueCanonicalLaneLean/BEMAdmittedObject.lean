import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryElementMethodsBoundaryValueCanonicalLaneLean

structure BEMSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure BEMAdmittedObject where
  space : BEMSpace
  boundaryValueProblem : Prop
  boundaryIntegralEquation : Prop
  potentialTheoryApplied : Prop
  conclusion : boundaryIntegralEquation ∧ potentialTheoryApplied

def BEMWitnessClosed (O : BEMAdmittedObject) : Prop :=
  O.boundaryIntegralEquation ∧ O.potentialTheoryApplied

end BoundaryElementMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse