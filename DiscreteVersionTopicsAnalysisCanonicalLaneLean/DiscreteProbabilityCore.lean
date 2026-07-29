import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

structure DiscreteProbabilityCore where
  sampleSpace : Type u
  events : Set (Set (sampleSpace))
  probabilityMeasure : Set (sampleSpace) → ℝ
  probabilityAxioms : Prop
  discreteSupport : Prop

structure DiscreteProbabilityEvidence (D : DiscreteProbabilityCore) where
  probabilityAxiomsClosed : D.probabilityAxioms
  discreteSupportClosed : D.discreteSupport

def DiscreteProbabilityCoreClosed (D : DiscreteProbabilityCore) : Prop :=
  D.probabilityAxioms ∧ D.discreteSupport

theorem discrete_probability_core_closed_from_evidence (D : DiscreteProbabilityCore) (E : DiscreteProbabilityEvidence D) :
    DiscreteProbabilityCoreClosed D := by
  exact And.intro E.probabilityAxiomsClosed E.discreteSupportClosed

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse