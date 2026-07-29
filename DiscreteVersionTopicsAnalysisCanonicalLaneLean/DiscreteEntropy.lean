import DiscreteVersionTopicsAnalysisCanonicalLaneLean.DiscreteProbabilityCore

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

structure DiscreteEntropy (D : DiscreteProbabilityCore) where
  entropyDef : (D.sampleSpace → ℝ) → ℝ
  nonnegativity : Prop
  chainRule : Prop
  dataProcessingInequality : Prop

structure DiscreteEntropyEvidence {D : DiscreteProbabilityCore} (E : DiscreteEntropy D) where
  nonnegativityClosed : E.nonnegativity
  chainRuleClosed : E.chainRule
  dataProcessingInequalityClosed : E.dataProcessingInequality

def DiscreteEntropyClosed {D : DiscreteProbabilityCore} (E : DiscreteEntropy D) : Prop :=
  E.nonnegativity ∧ E.chainRule ∧ E.dataProcessingInequality

theorem discrete_entropy_closed_from_evidence {D : DiscreteProbabilityCore} (E : DiscreteEntropy D) (Ev : DiscreteEntropyEvidence E) :
    DiscreteEntropyClosed E := by
  exact And.intro Ev.nonnegativityClosed (And.intro Ev.chainRuleClosed Ev.dataProcessingInequalityClosed)

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse