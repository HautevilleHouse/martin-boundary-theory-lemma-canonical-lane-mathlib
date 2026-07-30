import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartinBoundaryTheoryLemmaCanonicalLaneLean

structure MartinMeasurePackage where
  domain : Type u
  topology : TopologicalSpace domain
  measure : Set domain → ℝ≥0
  harmonicFunctions : Set (domain → ℝ)
  martinKernel : domain → domain → ℝ
  boundary : Type v
  boundaryTopology : TopologicalSpace boundary
  martinMeasure : Set boundary → ℝ≥0

structure MartinMeasureEvidence (M : MartinMeasurePackage) where
  measurePositive : ∀ U nonempty_open, M.measure U > 0
  kernelHarmonic : ∀ x : M.domain, M.martinKernel x ∈ M.harmonicFunctions
  martinMeasureFromKernel : Prop

def MartinMeasureClosed (M : MartinMeasurePackage) : Prop :=
  (∀ x, M.martinKernel x ∈ M.harmonicFunctions) ∧ M.martinMeasureFromKernel

theorem martin_measure_closed_from_evidence (M : MartinMeasurePackage)
    (E : MartinMeasureEvidence M) : MartinMeasureClosed M := by
  exact And.intro E.kernelHarmonic E.martinMeasureFromKernel

end MartinBoundaryTheoryLemmaCanonicalLaneLean
end HautevilleHouse