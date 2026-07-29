import BEMCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryElementMethodsBoundaryValueCanonicalLaneLean

structure BoundaryElementAdmittedObject where
  domain : Type u
  boundary : Type v
  problem : Prop
  solution : Prop
  conclusion : solution

structure AdmissibleClass where
  object : BoundaryElementAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.solution ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BoundaryElementMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse