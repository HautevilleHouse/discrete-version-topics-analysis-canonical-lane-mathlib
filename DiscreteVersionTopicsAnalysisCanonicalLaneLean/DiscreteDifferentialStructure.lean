import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteVersionTopicsAnalysisCanonicalLaneLean.DiscreteMetricStructure
import HautevilleHouse.DiscreteVersionTopicsAnalysisCanonicalLaneLean.DiscreteTopology

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

structure DiscreteDifferentialPackage {M : DiscreteMetricPackage} {T : DiscreteTopologyPackage} where
  derivativeOperator : M.vertexSet → (M.vertexSet → ℚ)
  linearity : ∀ (f g : M.vertexSet → ℚ) (a b : ℚ), (λ x => a * f x + b * g x) = λ x => a * derivativeOperator x f + b * derivativeOperator x g
  leibnizRule : ∀ (f g : M.vertexSet → ℚ) (x : M.vertexSet), derivativeOperator x (f * g) = f x * derivativeOperator x g + g x * derivativeOperator x f

structure DiscreteDifferentialEvidence {M : DiscreteMetricPackage} {T : DiscreteTopologyPackage}
    (D : DiscreteDifferentialPackage M T) where
  linearityClosed : D.linearity
  leibnizRuleClosed : D.leibnizRule

def DiscreteDifferentialClosed {M : DiscreteMetricPackage} {T : DiscreteTopologyPackage}
    (D : DiscreteDifferentialPackage M T) : Prop :=
  D.linearity ∧ D.leibnizRule

theorem discrete_differential_closed_from_evidence {M : DiscreteMetricPackage} {T : DiscreteTopologyPackage}
    (D : DiscreteDifferentialPackage M T) (E : DiscreteDifferentialEvidence D) :
    DiscreteDifferentialClosed D := by
  exact And.intro E.linearityClosed E.leibnizRuleClosed

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse