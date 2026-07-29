import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryElementMethodsBoundaryValueCanonicalLaneLean.BoundaryIntegralOperators

namespace HautevilleHouse
namespace BoundaryElementMethodsBoundaryValueCanonicalLaneLean

structure PotentialTheoryClassificationPackage (B : BoundaryValueProblemPackage) (I : IntegralEquationPackage B) (P : PotentialTheoryPackage B I) (E : BoundaryElementPackage B I P) (O : BoundaryIntegralOperatorsPackage B I P E) where
  singleLayerInvertibility : Prop
  doubleLayerSpectrum : Prop
  rangeCharacterization : Prop
  mappingTheorem : Prop

structure PotentialTheoryClassificationEvidence (B : BoundaryValueProblemPackage) (I : IntegralEquationPackage B) (P : PotentialTheoryPackage B I) (E : BoundaryElementPackage B I P) (O : BoundaryIntegralOperatorsPackage B I P E) (C : PotentialTheoryClassificationPackage B I P E O) where
  singleLayerInvertibilityClosed : C.singleLayerInvertibility
  doubleLayerSpectrumClosed : C.doubleLayerSpectrum
  rangeCharacterizationClosed : C.rangeCharacterization
  mappingTheoremClosed : C.mappingTheorem

def PotentialTheoryClassificationClosed (B : BoundaryValueProblemPackage) (I : IntegralEquationPackage B) (P : PotentialTheoryPackage B I) (E : BoundaryElementPackage B I P) (O : BoundaryIntegralOperatorsPackage B I P E) (C : PotentialTheoryClassificationPackage B I P E O) : Prop :=
  C.singleLayerInvertibility ∧ C.doubleLayerSpectrum ∧ C.rangeCharacterization ∧ C.mappingTheorem

theorem potential_theory_classification_closed_from_evidence (B : BoundaryValueProblemPackage) (I : IntegralEquationPackage B) (P : PotentialTheoryPackage B I) (E : BoundaryElementPackage B I P) (O : BoundaryIntegralOperatorsPackage B I P E) (C : PotentialTheoryClassificationPackage B I P E O) (Ev : PotentialTheoryClassificationEvidence B I P E O C) : PotentialTheoryClassificationClosed B I P E O C := by
  exact And.intro Ev.singleLayerInvertibilityClosed (And.intro Ev.doubleLayerSpectrumClosed (And.intro Ev.rangeCharacterizationClosed Ev.mappingTheoremClosed))

end BoundaryElementMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse