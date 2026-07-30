import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MartinBoundaryTheoryLemmaCanonicalLaneLean.HarmonicFunctionPackage

namespace HautevilleHouse
namespace MartinBoundaryTheoryLemmaCanonicalLaneLean

structure PositiveHarmonicDecompositionPackage {H : HarmonicFunctionPackage} where
  positiveHarmonicFunctions : Type u
  minimalHarmonicFunctions : Prop
  integralRepresentation : Prop
  uniquenessOfRepresentation : Prop
  minimalHarmonicFunctionsTerm : minimalHarmonicFunctions
  integralRepresentationTerm : integralRepresentation
  uniquenessOfRepresentationTerm : uniquenessOfRepresentation

structure PositiveHarmonicDecompositionEvidence {H : HarmonicFunctionPackage}
    (P : PositiveHarmonicDecompositionPackage H) where
  minimalHarmonicFunctionsClosed : P.minimalHarmonicFunctions
  integralRepresentationClosed : P.integralRepresentation
  uniquenessOfRepresentationClosed : P.uniquenessOfRepresentation

def PositiveHarmonicDecompositionClosed {H : HarmonicFunctionPackage}
    (P : PositiveHarmonicDecompositionPackage H) : Prop :=
  P.minimalHarmonicFunctions ∧ P.integralRepresentation ∧ P.uniquenessOfRepresentation

theorem positive_harmonic_decomposition_closed_from_evidence
    {H : HarmonicFunctionPackage} (P : PositiveHarmonicDecompositionPackage H)
    (E : PositiveHarmonicDecompositionEvidence P) : PositiveHarmonicDecompositionClosed P := by
  exact And.intro E.minimalHarmonicFunctionsClosed
    (And.intro E.integralRepresentationClosed E.uniquenessOfRepresentationClosed)

end MartinBoundaryTheoryLemmaCanonicalLaneLean
end HautevilleHouse
