import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartinBoundaryTheoryLemmaCanonicalLaneLean

structure HarmonicFunctionPackage (M : Type u) [TopologicalSpace M] where
  sheaf : Type v
  sheafOfRings : Prop
  sheafOfRingsClosed : sheafOfRings
  structurePresheaf : Prop
  structurePresheafClosed : structurePresheaf
  harmonicSection : Prop
  harmonicSectionClosed : harmonicSection
  maximumPrinciple : Prop
  maximumPrincipleClosed : maximumPrinciple

structure HarmonicFunctionEvidence {M : Type u} [TopologicalSpace M] (P : HarmonicFunctionPackage M) where
  sheafOfRingsClosed : P.sheafOfRings
  structurePresheafClosed : P.structurePresheaf
  harmonicSectionClosed : P.harmonicSection
  maximumPrincipleClosed : P.maximumPrinciple

def HarmonicFunctionSpaceClosed {M : Type u} [TopologicalSpace M] (P : HarmonicFunctionPackage M) : Prop :=
  P.sheafOfRings ∧ P.structurePresheaf ∧ P.harmonicSection ∧ P.maximumPrinciple

theorem harmonic_function_space_closed_from_evidence
    {M : Type u} [TopologicalSpace M] (P : HarmonicFunctionPackage M) (E : HarmonicFunctionEvidence P) :
    HarmonicFunctionSpaceClosed P := by
  exact And.intro E.sheafOfRingsClosed
    (And.intro E.structurePresheafClosed
      (And.intro E.harmonicSectionClosed E.maximumPrincipleClosed))

end MartinBoundaryTheoryLemmaCanonicalLaneLean
end HautevilleHouse