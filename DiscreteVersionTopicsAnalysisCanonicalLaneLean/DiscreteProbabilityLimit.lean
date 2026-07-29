import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

structure DiscreteProbabilityPackage where
  sampleSpace : Type u
  events : Set (Set sampleSpace)
  probabilityMeasure : Set sampleSpace → ℝ
  sequenceOfVariables : ℕ → (sampleSpace → ℝ)
  limitDistribution : Set sampleSpace → ℝ
  convergenceInLaw : Prop

structure DiscreteProbabilityEvidence (P : DiscreteProbabilityPackage) where
  probabilityMeasureClosed : ∀ A ∈ P.events, P.probabilityMeasure A ≥ 0 ∧ P.probabilityMeasure (Set.univ) = 1
  convergenceInLawClosed : P.convergenceInLaw
  limitDistributionClosed : ∀ A ∈ P.events, P.limitDistribution A = P.probabilityMeasure A

def DiscreteProbabilityClosed (P : DiscreteProbabilityPackage) : Prop :=
  (∀ A ∈ P.events, P.probabilityMeasure A ≥ 0 ∧ P.probabilityMeasure (Set.univ) = 1) ∧
  P.convergenceInLaw ∧ (∀ A ∈ P.events, P.limitDistribution A = P.probabilityMeasure A)

theorem discrete_probability_closed_from_evidence (P : DiscreteProbabilityPackage) (E : DiscreteProbabilityEvidence P) :
    DiscreteProbabilityClosed P := by
  exact And.intro E.probabilityMeasureClosed (And.intro E.convergenceInLawClosed E.limitDistributionClosed)

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse