import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryElementMethodsBoundaryValueCanonicalLaneLean

structure PotentialTheoryPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  laplacian : Type v
  fundamentalSolution : Type w
  harmonicFunctionSpace : Type x
  greenFunctionDefined : Prop
  potentialRegularity : Prop

structure PotentialTheoryEvidence (G : PotentialTheoryPackage) where
  greenFunctionDefinedClosed : G.greenFunctionDefined
  potentialRegularityClosed : G.potentialRegularity

def PotentialTheoryClosed (G : PotentialTheoryPackage) : Prop :=
  G.greenFunctionDefined ∧ G.potentialRegularity

theorem potential_theory_closed_from_evidence
    (G : PotentialTheoryPackage) (E : PotentialTheoryEvidence G) :
    PotentialTheoryClosed G := by
  exact And.intro E.greenFunctionDefinedClosed E.potentialRegularityClosed

end BoundaryElementMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse