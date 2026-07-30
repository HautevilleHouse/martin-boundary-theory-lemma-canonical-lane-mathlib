import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartinBoundaryTheoryLemmaCanonicalLaneLean

structure MartinRepresentationPackage (M : Type u) [TopologicalSpace M] (H : HarmonicFunctionPackage M) (C : MartinCompactificationPackage M) where
  poissonKernel : Prop
  martinIntegral : Prop
  boundaryRepresentation : Prop
  uniqueness : Prop
  poissonKernelClosed : poissonKernel
  martinIntegralClosed : martinIntegral
  boundaryRepresentationClosed : boundaryRepresentation
  uniquenessClosed : uniqueness

structure MartinRepresentationEvidence {M : Type u} [TopologicalSpace M]
    {H : HarmonicFunctionPackage M} {C : MartinCompactificationPackage M}
    (P : MartinRepresentationPackage M H C) where
  poissonKernelClosed : P.poissonKernel
  martinIntegralClosed : P.martinIntegral
  boundaryRepresentationClosed : P.boundaryRepresentation
  uniquenessClosed : P.uniqueness

def MartinRepresentationClosed {M : Type u} [TopologicalSpace M]
    {H : HarmonicFunctionPackage M} {C : MartinCompactificationPackage M}
    (P : MartinRepresentationPackage M H C) : Prop :=
  P.poissonKernel ∧ P.martinIntegral ∧ P.boundaryRepresentation ∧ P.uniqueness

theorem martin_representation_closed_from_evidence
    {M : Type u} [TopologicalSpace M] {H : HarmonicFunctionPackage M} {C : MartinCompactificationPackage M}
    (P : MartinRepresentationPackage M H C) (E : MartinRepresentationEvidence P) :
    MartinRepresentationClosed P := by
  exact And.intro E.poissonKernelClosed
    (And.intro E.martinIntegralClosed
      (And.intro E.boundaryRepresentationClosed E.uniquenessClosed))

end MartinBoundaryTheoryLemmaCanonicalLaneLean
end HautevilleHouse