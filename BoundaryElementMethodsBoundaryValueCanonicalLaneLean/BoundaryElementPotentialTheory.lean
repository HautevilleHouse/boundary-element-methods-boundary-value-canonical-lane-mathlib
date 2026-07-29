import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryElementMethodsBoundaryValueCanonicalLaneLean

structure PotentialTheoryPackage where
  domain : Type u
  boundary : Type v
  laplaceOperator : Prop
  fundamentalSolution : Prop
  potentialIntegral : Prop
  continuityAcrossBoundary : Prop

structure PotentialTheoryEvidence (P : PotentialTheoryPackage) where
  laplaceOperatorClosed : P.laplaceOperator
  fundamentalSolutionClosed : P.fundamentalSolution
  potentialIntegralClosed : P.potentialIntegral
  continuityAcrossBoundaryClosed : P.continuityAcrossBoundary

def PotentialTheoryClosed (P : PotentialTheoryPackage) : Prop :=
  P.laplaceOperator ∧ P.fundamentalSolution ∧ P.potentialIntegral ∧ P.continuityAcrossBoundary

theorem potential_theory_closed_from_evidence (P : PotentialTheoryPackage)
    (E : PotentialTheoryEvidence P) : PotentialTheoryClosed P := by
  exact And.intro E.laplaceOperatorClosed
    (And.intro E.fundamentalSolutionClosed
      (And.intro E.potentialIntegralClosed E.continuityAcrossBoundaryClosed))

end BoundaryElementMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse