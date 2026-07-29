import DiscreteVersionTopicsAnalysisCanonicalLaneLean.DiscreteProbabilityCore

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

structure DiscreteMartingale (D : DiscreteProbabilityCore) where
  timeIndex : Type u
  filtration : timeIndex → Set (Set D.sampleSpace)
  adaptedProcess : timeIndex → (D.sampleSpace → ℝ)
  martingaleProperty : Prop
  optionalStoppingTheorem : Prop

structure DiscreteMartingaleEvidence {D : DiscreteProbabilityCore} (M : DiscreteMartingale D) where
  martingalePropertyClosed : M.martingaleProperty
  optionalStoppingTheoremClosed : M.optionalStoppingTheorem

def DiscreteMartingaleClosed {D : DiscreteProbabilityCore} (M : DiscreteMartingale D) : Prop :=
  M.martingaleProperty ∧ M.optionalStoppingTheorem

theorem discrete_martingale_closed_from_evidence {D : DiscreteProbabilityCore} (M : DiscreteMartingale D) (E : DiscreteMartingaleEvidence M) :
    DiscreteMartingaleClosed M := by
  exact And.intro E.martingalePropertyClosed E.optionalStoppingTheoremClosed

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse