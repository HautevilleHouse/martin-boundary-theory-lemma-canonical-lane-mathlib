import HautevilleHouse.MartinBoundaryTheoryLemmaCanonicalLaneLean.MartinBoundaryTheory

namespace HautevilleHouse
namespace MartinBoundaryTheoryLemmaCanonicalLaneLean

structure FatouTypeClosurePackage {M : MartinBoundaryPackage}
    (T : MartinBoundaryTheoryPackage M) where
  fatouTheorem : Prop
  radialLimit : Prop
  convergenceDomain : Prop
  boundaryRegularity : Prop

structure FatouTypeClosureEvidence {M : MartinBoundaryPackage}
    {T : MartinBoundaryTheoryPackage M} (F : FatouTypeClosurePackage T) where
  fatouTheoremClosed : F.fatouTheorem
  radialLimitClosed : F.radialLimit
  convergenceDomainClosed : F.convergenceDomain
  boundaryRegularityClosed : F.boundaryRegularity

def FatouTypeClosureClosed {M : MartinBoundaryPackage}
    {T : MartinBoundaryTheoryPackage M} (F : FatouTypeClosurePackage T) : Prop :=
  F.fatouTheorem ∧ F.radialLimit ∧ F.convergenceDomain ∧ F.boundaryRegularity

theorem fatou_type_closure_closed_from_evidence {M : MartinBoundaryPackage}
    {T : MartinBoundaryTheoryPackage M} (F : FatouTypeClosurePackage T)
    (E : FatouTypeClosureEvidence F) : FatouTypeClosureClosed F := by
  exact And.intro E.fatouTheoremClosed
    (And.intro E.radialLimitClosed
      (And.intro E.convergenceDomainClosed E.boundaryRegularityClosed))

end MartinBoundaryTheoryLemmaCanonicalLaneLean
end HautevilleHouse
