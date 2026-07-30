import canonicalLaneMathlib.HarmonicFunctionSpace

/-!
# Green Function Kernel Package
-/

namespace HautevilleHouse
namespace MartinBoundaryTheoryLemmaCanonicalLaneLean

structure GreenFunctionKernel {H : HarmonicFunctionSpace} where
  kernelFunction : H.domain → H.domain → ℝ
  positivityProperty : Prop
  symmetryProperty : Prop
  resolventEquation : Prop

structure GreenFunctionKernelEvidence {H : HarmonicFunctionSpace}
    (G : GreenFunctionKernel H) where
  positivityPropertyClosed : G.positivityProperty
  symmetryPropertyClosed : G.symmetryProperty
  resolventEquationClosed : G.resolventEquation

def GreenFunctionKernelClosed {H : HarmonicFunctionSpace}
    (G : GreenFunctionKernel H) : Prop :=
  G.positivityProperty ∧ G.symmetryProperty ∧ G.resolventEquation

theorem green_function_kernel_closed_from_evidence
    {H : HarmonicFunctionSpace} (G : GreenFunctionKernel H)
    (E : GreenFunctionKernelEvidence G) : GreenFunctionKernelClosed G := by
  exact And.intro E.positivityPropertyClosed
    (And.intro E.symmetryPropertyClosed E.resolventEquationClosed)

end MartinBoundaryTheoryLemmaCanonicalLaneLean
end HautevilleHouse