import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MartinBoundaryTheoryLemmaCanonicalLaneLean.FatouTypeLemma

namespace HautevilleHouse
namespace MartinBoundaryTheoryLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure MartinBoundaryAdmittedObject where
  harmonicSpace : HarmonicFunctionPackage
  positiveDecomposition : PositiveHarmonicDecompositionPackage harmonicSpace
  martinConstruction : MartinBoundaryConstructionPackage positiveDecomposition
  representation : MartinRepresentationTheoremPackage martinConstruction
  fatouLemma : FatouTypeLemmaPackage representation
  boundaryComplete : Prop
  boundaryCompleteTerm : boundaryComplete

structure MartinBoundaryAdmissibleClass where
  object : MartinBoundaryAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def bridgeClosed (A : MartinBoundaryAdmissibleClass) : Prop :=
  A.object.boundaryComplete

theorem bridge_from_admissible_class (A : MartinBoundaryAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.boundaryCompleteTerm

def gateClosed (A : MartinBoundaryAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : MartinBoundaryAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

def ConstrainedMartinBoundaryClosure (A : MartinBoundaryAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_martin_boundary_endgame (A : MartinBoundaryAdmissibleClass) :
    ConstrainedMartinBoundaryClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MartinBoundaryTheoryLemmaCanonicalLaneLean
end HautevilleHouse
