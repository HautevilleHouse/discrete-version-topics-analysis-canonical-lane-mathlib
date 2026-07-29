import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

structure DiscreteAdmittedObject where
  discreteSpace : Type
  topology : TopologicalSpace discreteSpace
  discreteMetricSpace : Prop
  coveringDimension : ℕ
  simplyConnectedHomotopy : Prop
  conclusion : simplyConnectedHomotopy

structure DiscreteAdmissibleClass where
  object : DiscreteAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : DiscreteAdmissibleClass) : Prop :=
  DiscreteWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse
