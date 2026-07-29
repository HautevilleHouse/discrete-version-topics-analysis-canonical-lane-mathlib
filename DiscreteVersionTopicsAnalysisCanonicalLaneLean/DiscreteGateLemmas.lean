import DiscreteVersionTopicsAnalysisCanonicalLaneLean.DiscreteBridgeLemmas

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

def gateClosed (A : DiscreteAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : DiscreteAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse
