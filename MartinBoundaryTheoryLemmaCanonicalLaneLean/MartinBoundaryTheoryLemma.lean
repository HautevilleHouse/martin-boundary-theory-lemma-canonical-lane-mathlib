import canonicalLaneMathlib.MartinBoundaryCompactification

/-!
# Martin Boundary Theory Lemma Package
-/

namespace HautevilleHouse
namespace MartinBoundaryTheoryLemmaCanonicalLaneLean

structure MartinBoundaryTheoryLemma {H : HarmonicFunctionSpace}
    {G : GreenFunctionKernel H} {M : MartinBoundaryCompactification H G} where
  boundaryMinimality : Prop
  integralRepresentation : Prop
  positiveHarmonicFunctionsClassified : Prop

structure MartinBoundaryTheoryLemmaEvidence
    {H : HarmonicFunctionSpace} {G : GreenFunctionKernel H}
    {M : MartinBoundaryCompactification H G}
    (L : MartinBoundaryTheoryLemma H G M) where
  boundaryMinimalityClosed : L.boundaryMinimality
  integralRepresentationClosed : L.integralRepresentation
  positiveHarmonicFunctionsClassifiedClosed : L.positiveHarmonicFunctionsClassified

def MartinBoundaryTheoryLemmaClosed
    {H : HarmonicFunctionSpace} {G : GreenFunctionKernel H}
    {M : MartinBoundaryCompactification H G}
    (L : MartinBoundaryTheoryLemma H G M) : Prop :=
  L.boundaryMinimality ∧ L.integralRepresentation ∧ L.positiveHarmonicFunctionsClassified

theorem martin_boundary_theory_lemma_closed_from_evidence
    {H : HarmonicFunctionSpace} {G : GreenFunctionKernel H}
    {M : MartinBoundaryCompactification H G}
    (L : MartinBoundaryTheoryLemma H G M)
    (E : MartinBoundaryTheoryLemmaEvidence L) :
    MartinBoundaryTheoryLemmaClosed L := by
  exact And.intro E.boundaryMinimalityClosed
    (And.intro E.integralRepresentationClosed E.positiveHarmonicFunctionsClassifiedClosed)

end MartinBoundaryTheoryLemmaCanonicalLaneLean
end HautevilleHouse