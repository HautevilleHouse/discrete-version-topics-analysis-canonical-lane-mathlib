import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

def ConstrainedDiscreteVersionClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_discrete_version_endgame (A : AdmissibleClass) :
    ConstrainedDiscreteVersionClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse