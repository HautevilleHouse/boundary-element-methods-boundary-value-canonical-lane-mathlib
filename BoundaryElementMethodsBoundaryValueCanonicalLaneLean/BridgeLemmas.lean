import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryElementMethodsBoundaryValueCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BEMWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BoundaryElementMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse