import HautevilleHouse.MartinBoundaryTheoryLemmaCanonicalLaneLean.TheoremStatement
import canonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace MartinBoundaryTheoryLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure MartinBoundarySpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure MartinBoundaryAdmittedObject where
  space : MartinBoundarySpace
  greenFunctionDomain : Prop
  martinBoundaryDefined : Prop
  boundaryModel : Type
  boundaryTopology : TopologicalSpace boundaryModel
  homeomorphicToBoundary : Prop
  conclusion : homeomorphicToBoundary

structure MartinBoundaryEndgameState where
  object : MartinBoundaryAdmittedObject

def MartinBoundaryWitnessClosed (O : MartinBoundaryAdmittedObject) : Prop :=
  O.homeomorphicToBoundary

end MartinBoundaryTheoryLemmaCanonicalLaneLean
end HautevilleHouse
