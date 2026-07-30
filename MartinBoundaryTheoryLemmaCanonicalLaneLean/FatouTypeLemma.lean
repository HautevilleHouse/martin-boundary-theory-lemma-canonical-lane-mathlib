import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MartinBoundaryTheoryLemmaCanonicalLaneLean.MartinRepresentationTheorem

namespace HautevilleHouse
namespace MartinBoundaryTheoryLemmaCanonicalLaneLean

structure FatouTypeLemmaPackage {H : HarmonicFunctionPackage}
    {P : PositiveHarmonicDecompositionPackage H}
    {M : MartinBoundaryConstructionPackage P}
    {R : MartinRepresentationTheoremPackage M} where
  boundaryBehavior : Prop
  nontangentialLimit : Prop
  limitExistsAlmostEverywhere : Prop
  boundaryBehaviorTerm : boundaryBehavior
  nontangentialLimitTerm : nontangentialLimit
  limitExistsAlmostEverywhereTerm : limitExistsAlmostEverywhere

structure FatouTypeLemmaEvidence {H : HarmonicFunctionPackage}
    {P : PositiveHarmonicDecompositionPackage H}
    {M : MartinBoundaryConstructionPackage P}
    {R : MartinRepresentationTheoremPackage M}
    (F : FatouTypeLemmaPackage R) where
  boundaryBehaviorClosed : F.boundaryBehavior
  nontangentialLimitClosed : F.nontangentialLimit
  limitExistsAlmostEverywhereClosed : F.limitExistsAlmostEverywhere

def FatouTypeLemmaClosed {H : HarmonicFunctionPackage}
    {P : PositiveHarmonicDecompositionPackage H}
    {M : MartinBoundaryConstructionPackage P}
    {R : MartinRepresentationTheoremPackage M}
    (F : FatouTypeLemmaPackage R) : Prop :=
  F.boundaryBehavior ∧ F.nontangentialLimit ∧ F.limitExistsAlmostEverywhere

theorem fatou_type_lemma_closed_from_evidence
    {H : HarmonicFunctionPackage} {P : PositiveHarmonicDecompositionPackage H}
    {M : MartinBoundaryConstructionPackage P}
    {R : MartinRepresentationTheoremPackage M}
    (F : FatouTypeLemmaPackage R) (E : FatouTypeLemmaEvidence F) : FatouTypeLemmaClosed F := by
  exact And.intro E.boundaryBehaviorClosed
    (And.intro E.nontangentialLimitClosed E.limitExistsAlmostEverywhereClosed)

end MartinBoundaryTheoryLemmaCanonicalLaneLean
end HautevilleHouse
