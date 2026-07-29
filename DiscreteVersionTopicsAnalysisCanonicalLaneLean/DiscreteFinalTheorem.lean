import DiscreteVersionTopicsAnalysisCanonicalLaneLean.DiscreteGateLemmas

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

def ConstrainedDiscreteClosure (A : DiscreteAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_discrete_endgame (A : DiscreteAdmissibleClass) :
    ConstrainedDiscreteClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse
