import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryElementMethodsBoundaryValueCanonicalLaneLean

structure BoundaryValueProblem where
  domain : Type u
  boundary : Type v
  pdeOperator : Type w
  sourceTerm : domain → ℝ
  boundaryCondition : boundary → ℝ
  domainTopology : TopologicalSpace domain
  boundaryTopology : TopologicalSpace boundary
  pdeType : String
  dimension : ℕ

default
  domainTopology := by infer_instance
  boundaryTopology := by infer_instance

theorem boundary_value_problem_default_dimension : dimension = 2 ∨ dimension = 3 := by
  sorry

structure BVPEvidence (B : BoundaryValueProblem) where
  domainHausdorff : T2Space B.domain
  boundaryClosed : IsClosed (Set.range (fun (x : B.boundary) => x))
  sourceTermSmooth : C∞ B.domain ℝ B.sourceTerm
  boundaryConditionSmooth : C∞ B.boundary ℝ B.boundaryCondition

def BVPClosed (B : BoundaryValueProblem) : Prop :=
  ∃ (h : T2Space B.domain) (h' : IsClosed (Set.range (fun (x : B.boundary) => x))),
    C∞ B.domain ℝ B.sourceTerm ∧ C∞ B.boundary ℝ B.boundaryCondition

theorem bvp_closed_from_evidence (B : BoundaryValueProblem) (E : BVPEvidence B) : BVPClosed B := by
  exact ⟨E.domainHausdorff, E.boundaryClosed, E.sourceTermSmooth, E.boundaryConditionSmooth⟩

end BoundaryElementMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse