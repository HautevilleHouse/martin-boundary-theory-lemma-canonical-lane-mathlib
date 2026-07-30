import MartinBoundaryTheoryLemmaCanonicalLaneLean.AdmissibleClass

/-!
# Martin Boundary Object Package
-/

namespace HautevilleHouse
namespace MartinBoundaryTheoryLemmaCanonicalLaneLean

structure MartinBoundaryObjectData where
  greenFunction : Prop
  minimalHarmonicFunctions : Prop
  martinCompactification : Prop
  boundaryRepresentation : Prop
  poissonIntegralFormula : Prop
  uniquenessOfRepresentation : Prop

structure MartinBoundaryEvidence (M : MartinBoundaryObjectData) where
  greenFunctionClosed : M.greenFunction
  minimalHarmonicFunctionsClosed : M.minimalHarmonicFunctions
  martinCompactificationClosed : M.martinCompactification
  boundaryRepresentationClosed : M.boundaryRepresentation
  poissonIntegralFormulaClosed : M.poissonIntegralFormula
  uniquenessOfRepresentationClosed : M.uniquenessOfRepresentation

def MartinBoundaryClosed (M : MartinBoundaryObjectData) : Prop :=
  M.greenFunction ∧ M.minimalHarmonicFunctions ∧ M.martinCompactification ∧
  M.boundaryRepresentation ∧ M.poissonIntegralFormula ∧ M.uniquenessOfRepresentation

theorem martin_boundary_closed_from_evidence (M : MartinBoundaryObjectData) (E : MartinBoundaryEvidence M) :
    MartinBoundaryClosed M := by
  exact And.intro E.greenFunctionClosed
    (And.intro E.minimalHarmonicFunctionsClosed
      (And.intro E.martinCompactificationClosed
        (And.intro E.boundaryRepresentationClosed
          (And.intro E.poissonIntegralFormulaClosed E.uniquenessOfRepresentationClosed))))

end MartinBoundaryTheoryLemmaCanonicalLaneLean
end HautevilleHouse