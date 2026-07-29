import BEMCanonicalLaneLean.GateLemmas
import BEMCanonicalLaneLean.AnalyticProof

namespace HautevilleHouse
namespace BoundaryElementMethodsBoundaryValueCanonicalLaneLean

def ConstrainedBEMClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bem_endgame (A : AdmissibleClass) :
    ConstrainedBEMClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BoundaryElementMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse