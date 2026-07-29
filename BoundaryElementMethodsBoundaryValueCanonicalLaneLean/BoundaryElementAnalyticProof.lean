import BEMCanonicalLaneLean.Convergence
import BEMCanonicalLaneLean.ErrorEstimates

namespace HautevilleHouse
namespace BoundaryElementMethodsBoundaryValueCanonicalLaneLean

structure BoundaryElementAnalyticCertificate (A : AdmissibleClass) where
  meshConvergence : MeshConvergencePackage A
  errorEstimates : ErrorEstimatesPackage A
  stability : Prop
  convergenceClosed : MeshConvergenceClosed meshConvergence
  errorEstimatesClosed : ErrorEstimatesClosed errorEstimates
  stabilityClosed : stability

def BoundaryElementAnalyticCertificateClosed {A : AdmissibleClass}
    (C : BoundaryElementAnalyticCertificate A) : Prop :=
  MeshConvergenceClosed C.meshConvergence ∧
  ErrorEstimatesClosed C.errorEstimates ∧
  C.stability

theorem boundary_element_analytic_certificate_closed
    {A : AdmissibleClass} (C : BoundaryElementAnalyticCertificate A) :
    BoundaryElementAnalyticCertificateClosed C := by
  exact And.intro C.convergenceClosed
    (And.intro C.errorEstimatesClosed C.stabilityClosed)

end BoundaryElementMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse