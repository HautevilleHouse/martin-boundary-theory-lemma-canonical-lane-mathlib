import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartinBoundaryTheoryLemmaCanonicalLaneLean

structure MartinBoundaryLemmaPackage where
  domain : Type u
  topology : TopologicalSpace domain
  martinBoundary : Type v
  boundaryTopology : TopologicalSpace martinBoundary
  harmonicFunctions : Set (domain → ℝ)
  positiveHarmonicFunctions : Set (domain → ℝ)
  martinKernel : domain → martinBoundary → ℝ
  martinMeasure : Set martinBoundary → ℝ≥0
  representation : (martinBoundary → ℝ) → (domain → ℝ)
  uniqueness : Prop
  boundaryIdentification : Prop

structure MartinBoundaryLemmaEvidence (M : MartinBoundaryLemmaPackage) where
  representationHarmonic : ∀ f : M.martinBoundary → ℝ, M.representation f ∈ M.harmonicFunctions
  uniquenessClosed : M.uniqueness
  boundaryIdentificationClosed : M.boundaryIdentification

def MartinBoundaryLemmaClosed (M : MartinBoundaryLemmaPackage) : Prop :=
  M.uniqueness ∧ M.boundaryIdentification

theorem martin_boundary_lemma_closed_from_evidence
    (M : MartinBoundaryLemmaPackage) (E : MartinBoundaryLemmaEvidence M) :
    MartinBoundaryLemmaClosed M := by
  exact And.intro E.uniquenessClosed E.boundaryIdentificationClosed

end MartinBoundaryTheoryLemmaCanonicalLaneLean
end HautevilleHouse