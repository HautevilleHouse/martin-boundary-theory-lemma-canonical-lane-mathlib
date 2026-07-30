import MartinBoundaryTheoryLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MartinBoundaryTheoryLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure MartinBoundaryEndgameState where
  object : MartinBoundaryObject

def martinBoundaryProjection : Projection MartinBoundaryEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem martin_boundary_projection_idempotent (x : MartinBoundaryEndgameState) :
    martinBoundaryProjection.toFun (martinBoundaryProjection.toFun x) = martinBoundaryProjection.toFun x := by
  exact martinBoundaryProjection.idempotent x

end MartinBoundaryTheoryLemmaCanonicalLaneLean
end HautevilleHouse