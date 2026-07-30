import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartinBoundaryTheoryLemmaCanonicalLaneLean

structure HarmonicFunctionPackage where
  space : Type u
  topology : TopologicalSpace space
  sheaf : Type v
  sheafOfHarmonicFunctions : Prop
  sheafOfHarmonicFunctionsTerm : sheafOfHarmonicFunctions

structure HarmonicFunctionEvidence (H : HarmonicFunctionPackage) where
  sheafOfHarmonicFunctionsClosed : H.sheafOfHarmonicFunctions

def HarmonicFunctionClosed (H : HarmonicFunctionPackage) : Prop :=
  H.sheafOfHarmonicFunctions

theorem harmonic_function_closed_from_evidence (H : HarmonicFunctionPackage)
    (E : HarmonicFunctionEvidence H) : HarmonicFunctionClosed H := by
  exact E.sheafOfHarmonicFunctionsClosed

end MartinBoundaryTheoryLemmaCanonicalLaneLean
end HautevilleHouse
