import DiscreteVersionTopicsAnalysisCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DiscreteWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse