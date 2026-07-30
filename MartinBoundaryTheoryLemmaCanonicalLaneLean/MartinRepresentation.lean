import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartinBoundaryTheoryLemmaCanonicalLaneLean

structure MartinRepresentationPackage where
  domain : Type u
  topology : TopologicalSpace domain
  harmonicFunctions : Set (domain → ℝ)
  positiveHarmonicFunctions : Set (domain → ℝ)
  martinBoundary : Type v
  boundaryTopology : TopologicalSpace martinBoundary
  martinKernel : domain → martinBoundary → ℝ
  representationMap : (martinBoundary → ℝ) → (domain → ℝ)
  integralRepresentation : Prop
  uniqueness : Prop

structure MartinRepresentationEvidence (M : MartinRepresentationPackage) where
  representationMapHarmonic : ∀ f : M.martinBoundary → ℝ, M.representationMap f ∈ M.harmonicFunctions
  integralRepresentationClosed : M.integralRepresentation
  uniquenessClosed : M.uniqueness

def MartinRepresentationClosed (M : MartinRepresentationPackage) : Prop :=
  M.integralRepresentation ∧ M.uniqueness

theorem martin_representation_closed_from_evidence
    (M : MartinRepresentationPackage) (E : MartinRepresentationEvidence M) :
    MartinRepresentationClosed M := by
  exact And.intro E.integralRepresentationClosed E.uniquenessClosed

end MartinBoundaryTheoryLemmaCanonicalLaneLean
end HautevilleHouse