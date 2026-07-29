import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

structure FiniteDifferenceScheme where
  stencil : List Int
  truncationError : Prop
  consistencyOrder : Nat
  stabilityCondition : Prop

structure FiniteDifferenceEvidence (S : FiniteDifferenceScheme) where
  truncationErrorClosed : S.truncationError
  consistencyOrderClosed : True
  stabilityConditionClosed : S.stabilityCondition

def FiniteDifferenceClosed (S : FiniteDifferenceScheme) : Prop :=
  S.truncationError ∧ S.stabilityCondition

theorem finite_difference_closed_from_evidence (S : FiniteDifferenceScheme)
    (E : FiniteDifferenceEvidence S) : FiniteDifferenceClosed S := by
  exact And.intro E.truncationErrorClosed E.stabilityConditionClosed

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse