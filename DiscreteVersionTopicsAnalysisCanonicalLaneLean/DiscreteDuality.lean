import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteVersionTopicsAnalysisCanonicalLaneLean.DiscreteFiberBundle

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

structure DiscreteDualityPackage {M : DiscreteMetricPackage} (B : DiscreteFiberBundlePackage M) where
  dualFiber : M.vertexSet → Type u
  dualPairing : (Σ x : M.vertexSet, B.fiber x × dualFiber x) → ℚ
  nondegenerate : ∀ (x : M.vertexSet) (v : B.fiber x), (∃ w : dualFiber x, dualPairing ⟨x, (v, w)⟩ ≠ 0) ∨ v = 0

structure DiscreteDualityEvidence {M : DiscreteMetricPackage} {B : DiscreteFiberBundlePackage M}
    (D : DiscreteDualityPackage B) where
  nondegenerateClosed : D.nondegenerate

def DiscreteDualityClosed {M : DiscreteMetricPackage} {B : DiscreteFiberBundlePackage M}
    (D : DiscreteDualityPackage B) : Prop :=
  D.nondegenerate

theorem discrete_duality_closed_from_evidence {M : DiscreteMetricPackage} {B : DiscreteFiberBundlePackage M}
    (D : DiscreteDualityPackage B) (E : DiscreteDualityEvidence D) :
    DiscreteDualityClosed D := by
  exact E.nondegenerateClosed

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse