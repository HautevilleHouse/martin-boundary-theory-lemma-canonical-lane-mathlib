import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartinBoundaryTheoryLemmaCanonicalLaneLean

structure MartinCompactificationPackage (M : Type u) [TopologicalSpace M] where
  baseSpace : Type v
  compactification : Type w
  embedding : Prop
  minimalBoundary : Prop
  martinMetric : Prop
  compactificationClosed : Prop
  embeddingClosed : embedding
  minimalBoundaryClosed : minimalBoundary
  martinMetricClosed : martinMetric

structure MartinCompactificationEvidence {M : Type u} [TopologicalSpace M] (P : MartinCompactificationPackage M) where
  embeddingClosed : P.embedding
  minimalBoundaryClosed : P.minimalBoundary
  martinMetricClosed : P.martinMetric

def MartinCompactificationClosed {M : Type u} [TopologicalSpace M] (P : MartinCompactificationPackage M) : Prop :=
  P.embedding ∧ P.minimalBoundary ∧ P.martinMetric

theorem martin_compactification_closed_from_evidence
    {M : Type u} [TopologicalSpace M] (P : MartinCompactificationPackage M) (E : MartinCompactificationEvidence P) :
    MartinCompactificationClosed P := by
  exact And.intro E.embeddingClosed
    (And.intro E.minimalBoundaryClosed E.martinMetricClosed)

end MartinBoundaryTheoryLemmaCanonicalLaneLean
end HautevilleHouse