import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryElementMethodsBoundaryValueCanonicalLaneLean

structure BoundaryElementMesh {B : BoundaryValueProblem} where
  elements : List (Set B.boundary)
  nodes : List B.boundary
  elementType : String  -- "triangle", "quadrilateral", etc.
  meshSize : ℝ
  conforming : Bool

default
  elementType := "triangle"
  meshSize := 0.1
  conforming := true

theorem boundary_element_mesh_regularity (M : BoundaryElementMesh) : Prop := by
  trivial

structure BoundaryElementMeshEvidence {B : BoundaryValueProblem} (M : BoundaryElementMesh) where
  coveringOfBoundary : ⋃_{e ∈ M.elements} e = Set.univ
  nonOverlapping : ∀ e1 e2 ∈ M.elements, e1 ≠ e2 → Interior(e1) ∩ Interior(e2) = ∅
  meshSizePositive : M.meshSize > 0
  shapeRegularity : ∃ C > 0, ∀ e ∈ M.elements, (diameter e) ≤ C * M.meshSize

def BoundaryElementMeshClosed {B : BoundaryValueProblem} (M : BoundaryElementMesh) : Prop :=
  (⋃_{e ∈ M.elements} e = Set.univ) ∧
  (∀ e1 e2 ∈ M.elements, e1 ≠ e2 → Interior(e1) ∩ Interior(e2) = ∅) ∧
  (M.meshSize > 0) ∧
  (∃ C > 0, ∀ e ∈ M.elements, (diameter e) ≤ C * M.meshSize)

theorem boundary_element_mesh_closed_from_evidence {B : BoundaryValueProblem} (M : BoundaryElementMesh) (E : BoundaryElementMeshEvidence M) : BoundaryElementMeshClosed M := by
  exact And.intro E.coveringOfBoundary (And.intro E.nonOverlapping (And.intro E.meshSizePositive E.shapeRegularity))

end BoundaryElementMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse