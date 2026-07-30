import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MartinBoundaryTheoryLemmaCanonicalLaneLean.PositiveHarmonicDecomposition

namespace HautevilleHouse
namespace MartinBoundaryTheoryLemmaCanonicalLaneLean

structure MartinBoundaryConstructionPackage {H : HarmonicFunctionPackage}
    {P : PositiveHarmonicDecompositionPackage H} where
  boundaryPoints : Type u
  boundaryTopology : TopologicalSpace boundaryPoints
  martinCompactification : Prop
  martinBoundaryEmbedding : Prop
  kernelFunction : Type v
  martinCompactificationTerm : martinCompactification
  martinBoundaryEmbeddingTerm : martinBoundaryEmbedding
  kernelFunctionDefined : kernelFunction

structure MartinBoundaryConstructionEvidence {H : HarmonicFunctionPackage}
    {P : PositiveHarmonicDecompositionPackage H}
    (M : MartinBoundaryConstructionPackage P) where
  martinCompactificationClosed : M.martinCompactification
  martinBoundaryEmbeddingClosed : M.martinBoundaryEmbedding

def MartinBoundaryConstructionClosed {H : HarmonicFunctionPackage}
    {P : PositiveHarmonicDecompositionPackage H}
    (M : MartinBoundaryConstructionPackage P) : Prop :=
  M.martinCompactification ∧ M.martinBoundaryEmbedding

theorem martin_boundary_construction_closed_from_evidence
    {H : HarmonicFunctionPackage} {P : PositiveHarmonicDecompositionPackage H}
    (M : MartinBoundaryConstructionPackage P)
    (E : MartinBoundaryConstructionEvidence M) : MartinBoundaryConstructionClosed M := by
  exact And.intro E.martinCompactificationClosed E.martinBoundaryEmbeddingClosed

end MartinBoundaryTheoryLemmaCanonicalLaneLean
end HautevilleHouse
