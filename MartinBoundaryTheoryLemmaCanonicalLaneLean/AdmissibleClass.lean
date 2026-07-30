import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartinBoundaryTheoryLemmaCanonicalLaneLean

structure AdmissibleClass where
  object : MartinBoundaryAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  MartinBoundaryWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MartinBoundaryTheoryLemmaCanonicalLaneLean
end HautevilleHouse