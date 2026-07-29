import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

structure Graph (V : Type) where
  neighbors : V → Set V
  symmetric : ∀ u v : V, v ∈ neighbors u ↔ u ∈ neighbors v

structure DiscreteHarmonicFunction {V : Type} (G : Graph V) where
  domain : Set V
  boundary : Set V
  functionOnVertices : V → ℝ
  laplacianZeroOnInterior : ∀ v ∈ domain \ boundary, ∑ u ∈ G.neighbors v, (functionOnVertices u - functionOnVertices v) = 0
  boundaryCondition : Set.range (λ v : V => functionOnVertices v) ⊆ Set.Icc 0 1

structure DiscreteHarmonicFunctionEvidence {V : Type} {G : Graph V} (H : DiscreteHarmonicFunction G) where
  laplacianZeroClosed : H.laplacianZeroOnInterior
  boundaryConditionClosed : H.boundaryCondition

def DiscreteHarmonicFunctionClosed {V : Type} {G : Graph V} (H : DiscreteHarmonicFunction G) : Prop :=
  H.laplacianZeroOnInterior ∧ H.boundaryCondition

theorem discrete_harmonic_function_closed_from_evidence {V : Type} {G : Graph V} (H : DiscreteHarmonicFunction G) (E : DiscreteHarmonicFunctionEvidence H) : DiscreteHarmonicFunctionClosed H :=
  And.intro E.laplacianZeroClosed E.boundaryConditionClosed

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse