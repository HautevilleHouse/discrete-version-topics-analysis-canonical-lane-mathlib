import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteVersionTopicsAnalysisCanonicalLaneLean.DiscreteMetricStructure

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

structure DiscreteFiberBundlePackage (M : DiscreteMetricPackage) where
  fiber : M.vertexSet → Type u
  projection : (Σ x : M.vertexSet, fiber x) → M.vertexSet
  projection_product : ∀ (x : M.vertexSet), projection ⟨x, (fiber x).inhabited⟩ = x

structure DiscreteFiberBundleEvidence {M : DiscreteMetricPackage} (B : DiscreteFiberBundlePackage M) where
  projection_productClosed : B.projection_product

def DiscreteFiberBundleClosed {M : DiscreteMetricPackage} (B : DiscreteFiberBundlePackage M) : Prop :=
  B.projection_product

theorem discrete_fiber_bundle_closed_from_evidence {M : DiscreteMetricPackage}
    (B : DiscreteFiberBundlePackage M) (E : DiscreteFiberBundleEvidence B) :
    DiscreteFiberBundleClosed B := by
  exact E.projection_productClosed

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse