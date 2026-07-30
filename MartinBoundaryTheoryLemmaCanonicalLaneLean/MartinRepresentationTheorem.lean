import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MartinBoundaryTheoryLemmaCanonicalLaneLean.MartinBoundaryConstruction

namespace HautevilleHouse
namespace MartinBoundaryTheoryLemmaCanonicalLaneLean

structure MartinRepresentationTheoremPackage {H : HarmonicFunctionPackage}
    {P : PositiveHarmonicDecompositionPackage H}
    {M : MartinBoundaryConstructionPackage P} where
  positiveHarmonicFunctionsOnSpace : Type u
  representationByKernel : Prop
  uniquenessOfMeasure : Prop
  boundaryMeasureExists : Prop
  representationByKernelTerm : representationByKernel
  uniquenessOfMeasureTerm : uniquenessOfMeasure
  boundaryMeasureExistsTerm : boundaryMeasureExists

structure MartinRepresentationTheoremEvidence {H : HarmonicFunctionPackage}
    {P : PositiveHarmonicDecompositionPackage H}
    {M : MartinBoundaryConstructionPackage P}
    (R : MartinRepresentationTheoremPackage M) where
  representationByKernelClosed : R.representationByKernel
  uniquenessOfMeasureClosed : R.uniquenessOfMeasure
  boundaryMeasureExistsClosed : R.boundaryMeasureExists

def MartinRepresentationTheoremClosed {H : HarmonicFunctionPackage}
    {P : PositiveHarmonicDecompositionPackage H}
    {M : MartinBoundaryConstructionPackage P}
    (R : MartinRepresentationTheoremPackage M) : Prop :=
  R.representationByKernel ∧ R.uniquenessOfMeasure ∧ R.boundaryMeasureExists

theorem martin_representation_theorem_closed_from_evidence
    {H : HarmonicFunctionPackage} {P : PositiveHarmonicDecompositionPackage H}
    {M : MartinBoundaryConstructionPackage P}
    (R : MartinRepresentationTheoremPackage M)
    (E : MartinRepresentationTheoremEvidence R) : MartinRepresentationTheoremClosed R := by
  exact And.intro E.representationByKernelClosed
    (And.intro E.uniquenessOfMeasureClosed E.boundaryMeasureExistsClosed)

end MartinBoundaryTheoryLemmaCanonicalLaneLean
end HautevilleHouse
