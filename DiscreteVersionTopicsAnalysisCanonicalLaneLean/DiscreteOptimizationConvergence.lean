import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

structure DiscreteOptimizationPackage where
  objective : ℝ → ℝ
  initialPoint : ℝ
  stepSize : ℕ → ℝ
  iterationSequence : ℕ → ℝ
  convergenceRate : ℕ → Prop
  optimalityCondition : Prop

structure DiscreteOptimizationEvidence (O : DiscreteOptimizationPackage) where
  stepSizePositive : ∀ n, O.stepSize n > 0
  iterationClosed : ∀ n, O.iterationSequence (n+1) = O.iterationSequence n - O.stepSize n * (derivative O.objective) (O.iterationSequence n)
  convergenceRateClosed : ∀ n, O.convergenceRate n
  optimalityConditionClosed : O.optimalityCondition

def DiscreteOptimizationClosed (O : DiscreteOptimizationPackage) : Prop :=
  (∀ n, O.stepSize n > 0) ∧ (∀ n, O.iterationSequence (n+1) = O.iterationSequence n - O.stepSize n * (derivative O.objective) (O.iterationSequence n)) ∧
  (∀ n, O.convergenceRate n) ∧ O.optimalityCondition

theorem discrete_optimization_closed_from_evidence (O : DiscreteOptimizationPackage) (E : DiscreteOptimizationEvidence O) :
    DiscreteOptimizationClosed O := by
  exact And.intro E.stepSizePositive (And.intro E.iterationClosed (And.intro E.convergenceRateClosed E.optimalityConditionClosed))

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse