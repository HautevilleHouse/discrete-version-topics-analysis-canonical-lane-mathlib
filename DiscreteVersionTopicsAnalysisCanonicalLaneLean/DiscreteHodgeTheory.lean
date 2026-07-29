import DiscreteVersionTopicsAnalysisCanonicalLaneLean.DiscreteMorseTheory

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

structure DiscreteHodgePackage {S : SimplicialComplexPackage} (M : DiscreteMorsePackage S) where
  chainComplex : Type
  coboundaryOperator : Type
  hodgeLaplacian : Type
  hodgeDecomposition : Prop
  heatKernelDiscrete : Prop
  convergenceToContinuous : Prop

structure DiscreteHodgeEvidence {S : SimplicialComplexPackage} {M : DiscreteMorsePackage S}
    (H : DiscreteHodgePackage M) where
  hodgeDecompositionClosed : H.hodgeDecomposition
  heatKernelDiscreteClosed : H.heatKernelDiscrete
  convergenceToContinuousClosed : H.convergenceToContinuous

def DiscreteHodgeClosed {S : SimplicialComplexPackage} {M : DiscreteMorsePackage S}
    (H : DiscreteHodgePackage M) : Prop :=
  H.hodgeDecomposition ∧ H.heatKernelDiscrete ∧ H.convergenceToContinuous

theorem discrete_hodge_closed_from_evidence {S : SimplicialComplexPackage} {M : DiscreteMorsePackage S}
    (H : DiscreteHodgePackage M) (E : DiscreteHodgeEvidence H) : DiscreteHodgeClosed H := by
  exact And.intro E.hodgeDecompositionClosed
    (And.intro E.heatKernelDiscreteClosed E.convergenceToContinuousClosed)

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse
