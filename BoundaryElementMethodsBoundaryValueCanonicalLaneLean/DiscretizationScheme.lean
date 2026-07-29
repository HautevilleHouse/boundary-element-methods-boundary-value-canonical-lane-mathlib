import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryElementMethodsBoundaryValueCanonicalLaneLean.BoundaryIntegralOperators
import HautevilleHouse.BoundaryElementMethodsBoundaryValueCanonicalLaneLean.PotentialTheoryClassification

namespace HautevilleHouse
namespace BoundaryElementMethodsBoundaryValueCanonicalLaneLean

structure DiscretizationSchemePackage (B : BoundaryValueProblemPackage) (I : IntegralEquationPackage B) (P : PotentialTheoryPackage B I) (E : BoundaryElementPackage B I P) (O : BoundaryIntegralOperatorsPackage B I P E) (C : PotentialTheoryClassificationPackage B I P E O) where
  collocationPoints : Prop
  boundaryElementSpace : Prop
  quadratureRule : Prop
  algebraicSystemFormed : Prop
  errorEstimate : Prop

structure DiscretizationSchemeEvidence (B : BoundaryValueProblemPackage) (I : IntegralEquationPackage B) (P : PotentialTheoryPackage B I) (E : BoundaryElementPackage B I P) (O : BoundaryIntegralOperatorsPackage B I P E) (C : PotentialTheoryClassificationPackage B I P E O) (D : DiscretizationSchemePackage B I P E O C) where
  collocationPointsClosed : D.collocationPoints
  boundaryElementSpaceClosed : D.boundaryElementSpace
  quadratureRuleClosed : D.quadratureRule
  algebraicSystemFormedClosed : D.algebraicSystemFormed
  errorEstimateClosed : D.errorEstimate

def DiscretizationSchemeClosed (B : BoundaryValueProblemPackage) (I : IntegralEquationPackage B) (P : PotentialTheoryPackage B I) (E : BoundaryElementPackage B I P) (O : BoundaryIntegralOperatorsPackage B I P E) (C : PotentialTheoryClassificationPackage B I P E O) (D : DiscretizationSchemePackage B I P E O C) : Prop :=
  D.collocationPoints ∧ D.boundaryElementSpace ∧ D.quadratureRule ∧ D.algebraicSystemFormed ∧ D.errorEstimate

theorem discretization_scheme_closed_from_evidence (B : BoundaryValueProblemPackage) (I : IntegralEquationPackage B) (P : PotentialTheoryPackage B I) (E : BoundaryElementPackage B I P) (O : BoundaryIntegralOperatorsPackage B I P E) (C : PotentialTheoryClassificationPackage B I P E O) (D : DiscretizationSchemePackage B I P E O C) (Ev : DiscretizationSchemeEvidence B I P E O C D) : DiscretizationSchemeClosed B I P E O C D := by
  exact And.intro Ev.collocationPointsClosed (And.intro Ev.boundaryElementSpaceClosed (And.intro Ev.quadratureRuleClosed (And.intro Ev.algebraicSystemFormedClosed Ev.errorEstimateClosed)))

end BoundaryElementMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse