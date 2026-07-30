import HautevilleHouse.MartinBoundaryTheoryLemmaCanonicalLaneLean.FatouTypeClosure

namespace HautevilleHouse
namespace MartinBoundaryTheoryLemmaCanonicalLaneLean

structure HarmonicFunctionClassificationPackage {M : MartinBoundaryPackage}
    {T : MartinBoundaryTheoryPackage M} {F : FatouTypeClosurePackage T} where
  positiveHarmonicFunctions : Prop
  minimalFunctionsClassified : Prop
  integralRepresentation : Prop
  boundaryMeasureDetermined : Prop

structure HarmonicFunctionClassificationEvidence {M : MartinBoundaryPackage}
    {T : MartinBoundaryTheoryPackage M} {F : FatouTypeClosurePackage T}
    (H : HarmonicFunctionClassificationPackage F) where
  positiveHarmonicFunctionsClosed : H.positiveHarmonicFunctions
  minimalFunctionsClassifiedClosed : H.minimalFunctionsClassified
  integralRepresentationClosed : H.integralRepresentation
  boundaryMeasureDeterminedClosed : H.boundaryMeasureDetermined

def HarmonicFunctionClassificationClosed {M : MartinBoundaryPackage}
    {T : MartinBoundaryTheoryPackage M} {F : FatouTypeClosurePackage T}
    (H : HarmonicFunctionClassificationPackage F) : Prop :=
  H.positiveHarmonicFunctions ∧ H.minimalFunctionsClassified ∧
  H.integralRepresentation ∧ H.boundaryMeasureDetermined

theorem harmonic_function_classification_closed_from_evidence {M : MartinBoundaryPackage}
    {T : MartinBoundaryTheoryPackage M} {F : FatouTypeClosurePackage T}
    (H : HarmonicFunctionClassificationPackage F) (E : HarmonicFunctionClassificationEvidence H) :
    HarmonicFunctionClassificationClosed H := by
  exact And.intro E.positiveHarmonicFunctionsClosed
    (And.intro E.minimalFunctionsClassifiedClosed
      (And.intro E.integralRepresentationClosed E.boundaryMeasureDeterminedClosed))

end MartinBoundaryTheoryLemmaCanonicalLaneLean
end HautevilleHouse
