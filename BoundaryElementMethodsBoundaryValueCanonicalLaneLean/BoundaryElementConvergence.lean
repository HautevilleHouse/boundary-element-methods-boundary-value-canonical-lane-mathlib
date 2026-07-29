import BEMCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryElementMethodsBoundaryValueCanonicalLaneLean

structure MeshConvergencePackage (A : AdmissibleClass) where
  hRefinement : Prop
  pRefinement : Prop
  errorEstimates : Prop
  optimalConvergence : Prop

structure MeshConvergenceEvidence {A : AdmissibleClass} (M : MeshConvergencePackage A) where
  hRefinementClosed : M.hRefinement
  pRefinementClosed : M.pRefinement
  errorEstimatesClosed : M.errorEstimates
  optimalConvergenceClosed : M.optimalConvergence

def MeshConvergenceClosed {A : AdmissibleClass} (M : MeshConvergencePackage A) : Prop :=
  M.hRefinement ∧ M.pRefinement ∧ M.errorEstimates ∧ M.optimalConvergence

theorem mesh_convergence_closed_from_evidence
    {A : AdmissibleClass} (M : MeshConvergencePackage A)
    (E : MeshConvergenceEvidence M) : MeshConvergenceClosed M := by
  exact And.intro E.hRefinementClosed
    (And.intro E.pRefinementClosed
      (And.intro E.errorEstimatesClosed E.optimalConvergenceClosed))

end BoundaryElementMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse