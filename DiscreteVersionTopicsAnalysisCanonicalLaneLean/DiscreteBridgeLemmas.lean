import DiscreteVersionTopicsAnalysisCanonicalLaneLean.DiscreteProjection

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

def bridgeClosed (A : DiscreteAdmissibleClass) : Prop :=
  DiscreteWitnessClosed A.object

theorem bridge_from_admissible_class (A : DiscreteAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse
