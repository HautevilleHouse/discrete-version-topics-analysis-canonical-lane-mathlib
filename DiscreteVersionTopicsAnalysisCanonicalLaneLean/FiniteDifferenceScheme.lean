import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

structure FiniteDifferenceSchemePackage where
  grid : ℕ → ℝ
  functionValues : ℕ → ℝ
  forwardDifference : ℕ → ℝ
  consistencyOrder : ℕ → Prop
  stabilityCondition : Prop

structure FiniteDifferenceSchemeEvidence (F : FiniteDifferenceSchemePackage) where
  gridStrictlyIncreasing : ∀ n, F.grid n < F.grid (n+1)
  forwardDifferenceClosed : ∀ n, F.forwardDifference n = (F.functionValues (n+1) - F.functionValues n) / (F.grid (n+1) - F.grid n)
  consistencyOrderClosed : ∀ n, F.consistencyOrder n
  stabilityConditionClosed : F.stabilityCondition

def FiniteDifferenceSchemeClosed (F : FiniteDifferenceSchemePackage) : Prop :=
  (∀ n, F.grid n < F.grid (n+1)) ∧ (∀ n, F.forwardDifference n = (F.functionValues (n+1) - F.functionValues n) / (F.grid (n+1) - F.grid n)) ∧
  (∀ n, F.consistencyOrder n) ∧ F.stabilityCondition

theorem finite_difference_scheme_closed_from_evidence (F : FiniteDifferenceSchemePackage) (E : FiniteDifferenceSchemeEvidence F) :
    FiniteDifferenceSchemeClosed F := by
  exact And.intro E.gridStrictlyIncreasing (And.intro E.forwardDifferenceClosed (And.intro E.consistencyOrderClosed E.stabilityConditionClosed))

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse