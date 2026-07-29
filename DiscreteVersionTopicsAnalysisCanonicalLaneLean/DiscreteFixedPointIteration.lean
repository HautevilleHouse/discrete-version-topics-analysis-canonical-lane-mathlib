import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

structure DiscreteFixedPointIteration where
  operator : Type u → Type v
  contractionFactor : Real
  fixedPointExistence : Prop
  convergenceRate : Prop

structure DiscreteFixedPointEvidence (I : DiscreteFixedPointIteration) where
  contractionFactorInUnit : I.contractionFactor < 1
  fixedPointExistenceClosed : I.fixedPointExistence
  convergenceRateClosed : I.convergenceRate

def DiscreteFixedPointClosed (I : DiscreteFixedPointIteration) : Prop :=
  I.contractionFactor < 1 ∧ I.fixedPointExistence ∧ I.convergenceRate

theorem discrete_fixed_point_closed_from_evidence
    (I : DiscreteFixedPointIteration)
    (E : DiscreteFixedPointEvidence I) : DiscreteFixedPointClosed I := by
  exact And.intro E.contractionFactorInUnit
    (And.intro E.fixedPointExistenceClosed E.convergenceRateClosed)

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse