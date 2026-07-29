import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

structure DiscreteGronwallPackage where
  timeStep : ℕ → ℝ
  constantC : ℝ
  bound : ℕ → ℝ
  differenceEquation : ℕ → Prop
  gronwallEstimate : ℕ → Prop

structure DiscreteGronwallEvidence (G : DiscreteGronwallPackage) where
  timeStepPositive : ∀ n, G.timeStep n > 0
  constantCMonotone : G.constantC ≥ 0
  differenceEquationClosed : ∀ n, G.differenceEquation n
  gronwallEstimateClosed : ∀ n, G.gronwallEstimate n

def DiscreteGronwallClosed (G : DiscreteGronwallPackage) : Prop :=
  (∀ n, G.timeStep n > 0) ∧ G.constantC ≥ 0 ∧ (∀ n, G.differenceEquation n) ∧ (∀ n, G.gronwallEstimate n)

theorem discrete_gronwall_closed_from_evidence (G : DiscreteGronwallPackage) (E : DiscreteGronwallEvidence G) :
    DiscreteGronwallClosed G := by
  exact And.intro E.timeStepPositive (And.intro E.constantCMonotone (And.intro E.differenceEquationClosed E.gronwallEstimateClosed))

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse