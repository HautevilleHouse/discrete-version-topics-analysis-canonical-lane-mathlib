import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

structure DiscreteMetricPackage where
  vertexSet : Type u
  weightFunction : vertexSet → vertexSet → ℚ
  symmetry : ∀ x y, weightFunction x y = weightFunction y x
  positivity : ∀ x y, x ≠ y → weightFunction x y > 0
  triangleInequality : ∀ x y z, weightFunction x z ≤ weightFunction x y + weightFunction y z

structure DiscreteMetricEvidence (M : DiscreteMetricPackage) where
  symmetryClosed : M.symmetry
  positivityClosed : M.positivity
  triangleInequalityClosed : M.triangleInequality

def DiscreteMetricClosed (M : DiscreteMetricPackage) : Prop :=
  M.symmetry ∧ M.positivity ∧ M.triangleInequality

theorem discrete_metric_closed_from_evidence (M : DiscreteMetricPackage) (E : DiscreteMetricEvidence M) :
    DiscreteMetricClosed M := by
  exact And.intro E.symmetryClosed (And.intro E.positivityClosed E.triangleInequalityClosed)

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse