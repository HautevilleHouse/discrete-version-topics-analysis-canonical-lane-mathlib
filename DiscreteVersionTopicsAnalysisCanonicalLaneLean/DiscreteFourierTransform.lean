import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

structure DiscreteFourierTransformPackage where
  inputSequence : ℕ → ℂ
  n : ℕ
  outputSequence : ℕ → ℂ
  orthogonality : Prop
  inversionFormula : Prop

structure DiscreteFourierTransformEvidence (D : DiscreteFourierTransformPackage) where
  outputSequenceClosed : ∀ k : ℕ, k < D.n → D.outputSequence k = ∑ j in Finset.range D.n, D.inputSequence j * Complex.exp (-2 * π * Complex.I * (j : ℂ) * (k : ℂ) / (D.n : ℂ))
  orthogonalityClosed : D.orthogonality
  inversionFormulaClosed : D.inversionFormula

def DiscreteFourierTransformClosed (D : DiscreteFourierTransformPackage) : Prop :=
  (∀ k : ℕ, k < D.n → D.outputSequence k = ∑ j in Finset.range D.n, D.inputSequence j * Complex.exp (-2 * π * Complex.I * (j : ℂ) * (k : ℂ) / (D.n : ℂ))) ∧
  D.orthogonality ∧ D.inversionFormula

theorem discrete_fourier_transform_closed_from_evidence (D : DiscreteFourierTransformPackage) (E : DiscreteFourierTransformEvidence D) :
    DiscreteFourierTransformClosed D := by
  exact And.intro E.outputSequenceClosed (And.intro E.orthogonalityClosed E.inversionFormulaClosed)

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse