import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteVersionTopicsAnalysisCanonicalLaneLean.DiscreteDifferentialStructure

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

structure DiscreteIndexPackage {M : DiscreteMetricPackage} {T : DiscreteTopologyPackage}
    (D : DiscreteDifferentialPackage M T) where
  kernelDimension : ℕ
  cokernelDimension : ℕ
  indexFormula : kernelDimension - cokernelDimension = 0

structure DiscreteIndexEvidence {M : DiscreteMetricPackage} {T : DiscreteTopologyPackage}
    {D : DiscreteDifferentialPackage M T} (I : DiscreteIndexPackage D) where
  indexFormulaClosed : I.indexFormula

def DiscreteIndexClosed {M : DiscreteMetricPackage} {T : DiscreteTopologyPackage}
    {D : DiscreteDifferentialPackage M T} (I : DiscreteIndexPackage D) : Prop :=
  I.indexFormula

theorem discrete_index_closed_from_evidence {M : DiscreteMetricPackage} {T : DiscreteTopologyPackage}
    {D : DiscreteDifferentialPackage M T} (I : DiscreteIndexPackage D) (E : DiscreteIndexEvidence I) :
    DiscreteIndexClosed I := by
  exact E.indexFormulaClosed

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse