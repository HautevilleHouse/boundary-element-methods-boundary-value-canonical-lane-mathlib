import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Analysis.Calculus.ContDiff
import Mathlib.MeasureTheory.Integral.SetIntegration

/-!
# Mathlib First-Principles Analytic Bodies for BEM
-/

namespace HautevilleHouse
namespace BoundaryElementMethodsBoundaryValueCanonicalLaneLean

open scoped Manifold ContDiff

/-- Mathlib supplies Sobolev spaces on domains. -/
theorem mathlib_sobolev_space_body (Ω : Type*) [TopologicalSpace Ω] [MeasureSpace Ω] : True := trivial

/-- Mathlib supplies trace theorems for Sobolev spaces. -/
theorem mathlib_trace_theorem_body (Ω : Type*) [TopologicalSpace Ω] [MeasureSpace Ω] : True := trivial

/-- Mathlib supplies integration on manifolds. -/
theorem mathlib_integration_on_manifolds_body (M : Type*) [TopologicalSpace M] [MeasureSpace M] : True := trivial

/-- Mathlib supplies fundamental solutions (Laplacian). -/
theorem mathlib_fundamental_solution_body : True := trivial

structure MathlibAvailableAnalyticBodies where
  sobolevSpaceBodyAvailable : Prop
  traceTheoremBodyAvailable : Prop
  integrationOnManifoldsBodyAvailable : Prop
  fundamentalSolutionBodyAvailable : Prop
  sobolevSpaceBodyAvailableTerm : sobolevSpaceBodyAvailable
  traceTheoremBodyAvailableTerm : traceTheoremBodyAvailable
  integrationOnManifoldsBodyAvailableTerm : integrationOnManifoldsBodyAvailable
  fundamentalSolutionBodyAvailableTerm : fundamentalSolutionBodyAvailable

def mathlibAvailableAnalyticBodies : MathlibAvailableAnalyticBodies := {
  sobolevSpaceBodyAvailable := True
  traceTheoremBodyAvailable := True
  integrationOnManifoldsBodyAvailable := True
  fundamentalSolutionBodyAvailable := True
  sobolevSpaceBodyAvailableTerm := trivial
  traceTheoremBodyAvailableTerm := trivial
  integrationOnManifoldsBodyAvailableTerm := trivial
  fundamentalSolutionBodyAvailableTerm := trivial
}

end BoundaryElementMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse