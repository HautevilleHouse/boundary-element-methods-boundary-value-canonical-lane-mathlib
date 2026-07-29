import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryElementMethodsBoundaryValueCanonicalLaneLean

structure MeshDiscretizationPackage {G : PotentialTheoryPackage}
    (F : BoundaryIntegralOperatorPackage G) where
  triangulation : Type u
  boundaryElement : Type v
  quadratureRule : Type w
  collocationPoints : Type x
  meshConvergence : Prop
  elementRegularity : Prop

structure MeshDiscretizationEvidence {G : PotentialTheoryPackage}
    {F : BoundaryIntegralOperatorPackage G} (M : MeshDiscretizationPackage F) where
  meshConvergenceClosed : M.meshConvergence
  elementRegularityClosed : M.elementRegularity

def MeshDiscretizationClosed {G : PotentialTheoryPackage}
    {F : BoundaryIntegralOperatorPackage G} (M : MeshDiscretizationPackage F) : Prop :=
  M.meshConvergence ∧ M.elementRegularity

theorem mesh_discretization_closed_from_evidence
    {G : PotentialTheoryPackage} {F : BoundaryIntegralOperatorPackage G}
    (M : MeshDiscretizationPackage F) (E : MeshDiscretizationEvidence M) :
    MeshDiscretizationClosed M := by
  exact And.intro E.meshConvergenceClosed E.elementRegularityClosed

end BoundaryElementMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse