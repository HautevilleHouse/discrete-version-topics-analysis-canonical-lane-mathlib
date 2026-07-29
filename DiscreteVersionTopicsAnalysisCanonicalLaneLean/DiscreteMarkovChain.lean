import DiscreteVersionTopicsAnalysisCanonicalLaneLean.DiscreteProbabilityCore

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

structure DiscreteMarkovChain (D : DiscreteProbabilityCore) where
  stateSpace : Type u
  transitionMatrix : stateSpace → stateSpace → ℝ
  markovProperty : Prop
  stationaryDistribution : Prop
  irreducible : Prop

structure DiscreteMarkovChainEvidence {D : DiscreteProbabilityCore} (M : DiscreteMarkovChain D) where
  markovPropertyClosed : M.markovProperty
  stationaryDistributionClosed : M.stationaryDistribution
  irreducibleClosed : M.irreducible

def DiscreteMarkovChainClosed {D : DiscreteProbabilityCore} (M : DiscreteMarkovChain D) : Prop :=
  M.markovProperty ∧ M.stationaryDistribution ∧ M.irreducible

theorem discrete_markov_chain_closed_from_evidence {D : DiscreteProbabilityCore} (M : DiscreteMarkovChain D) (E : DiscreteMarkovChainEvidence M) :
    DiscreteMarkovChainClosed M := by
  exact And.intro E.markovPropertyClosed (And.intro E.stationaryDistributionClosed E.irreducibleClosed)

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse