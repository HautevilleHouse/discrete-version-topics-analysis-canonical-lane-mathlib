import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteVersionTopicsAnalysisCanonicalLaneLean.DiscreteDifferentialStructure

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

structure DiscreteCohomologyPackage {M : DiscreteMetricPackage} {T : DiscreteTopologyPackage}
    (D : DiscreteDifferentialPackage M T) where
  cocycleCondition : (D.derivativeOperator (λ _ => 0)) = λ _ => (λ _ => 0)
  exactness : ∀ (f : M.vertexSet → ℚ), (∃ (g : M.vertexSet → ℚ), D.derivativeOperator (λ x => g x) = f) → (D.derivativeOperator (λ x => f x)) = λ _ => (λ _ => 0)

structure DiscreteCohomologyEvidence {M : DiscreteMetricPackage} {T : DiscreteTopologyPackage}
    {D : DiscreteDifferentialPackage M T} (H : DiscreteCohomologyPackage D) where
  cocycleConditionClosed : H.cocycleCondition
  exactnessClosed : H.exactness

def DiscreteCohomologyClosed {M : DiscreteMetricPackage} {T : DiscreteTopologyPackage}
    {D : DiscreteDifferentialPackage M T} (H : DiscreteCohomologyPackage D) : Prop :=
  H.cocycleCondition ∧ H.exactness

theorem discrete_cohomology_closed_from_evidence {M : DiscreteMetricPackage} {T : DiscreteTopologyPackage}
    {D : DiscreteDifferentialPackage M T} (H : DiscreteCohomologyPackage D) (E : DiscreteCohomologyEvidence H) :
    DiscreteCohomologyClosed H := by
  exact And.intro E.cocycleConditionClosed E.exactnessClosed

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse