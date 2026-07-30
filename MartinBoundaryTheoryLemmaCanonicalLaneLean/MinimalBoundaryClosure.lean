import HautevilleHouse.MartinBoundaryTheoryLemmaCanonicalLaneLean.HarmonicFunctionClassification

namespace HautevilleHouse
namespace MartinBoundaryTheoryLemmaCanonicalLaneLean

structure MinimalBoundaryClosurePackage {M : MartinBoundaryPackage}
    {T : MartinBoundaryTheoryPackage M} {F : FatouTypeClosurePackage T}
    {H : HarmonicFunctionClassificationPackage F} where
  minimalBoundaryIdentification : Prop
  choquetTheoryApplied : Prop
  extremeRaysClassified : Prop
  martinReproducingKernel : Prop

structure MinimalBoundaryClosureEvidence {M : MartinBoundaryPackage}
    {T : MartinBoundaryTheoryPackage M} {F : FatouTypeClosurePackage T}
    {H : HarmonicFunctionClassificationPackage F}
    (B : MinimalBoundaryClosurePackage H) where
  minimalBoundaryIdentificationClosed : B.minimalBoundaryIdentification
  choquetTheoryAppliedClosed : B.choquetTheoryApplied
  extremeRaysClassifiedClosed : B.extremeRaysClassified
  martinReproducingKernelClosed : B.martinReproducingKernel

def MinimalBoundaryClosureClosed {M : MartinBoundaryPackage}
    {T : MartinBoundaryTheoryPackage M} {F : FatouTypeClosurePackage T}
    {H : HarmonicFunctionClassificationPackage F}
    (B : MinimalBoundaryClosurePackage H) : Prop :=
  B.minimalBoundaryIdentification ∧ B.choquetTheoryApplied ∧
  B.extremeRaysClassified ∧ B.martinReproducingKernel

theorem minimal_boundary_closure_closed_from_evidence {M : MartinBoundaryPackage}
    {T : MartinBoundaryTheoryPackage M} {F : FatouTypeClosurePackage T}
    {H : HarmonicFunctionClassificationPackage F}
    (B : MinimalBoundaryClosurePackage H) (E : MinimalBoundaryClosureEvidence B) :
    MinimalBoundaryClosureClosed B := by
  exact And.intro E.minimalBoundaryIdentificationClosed
    (And.intro E.choquetTheoryAppliedClosed
      (And.intro E.extremeRaysClassifiedClosed E.martinReproducingKernelClosed))

end MartinBoundaryTheoryLemmaCanonicalLaneLean
end HautevilleHouse
