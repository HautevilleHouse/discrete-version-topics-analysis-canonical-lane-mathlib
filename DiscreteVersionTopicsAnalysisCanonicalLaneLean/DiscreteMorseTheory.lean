import DiscreteVersionTopicsAnalysisCanonicalLaneLean.DiscreteSimplicialComplex

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

structure DiscreteMorsePackage {S : SimplicialComplexPackage} (M : S) where
  morseFunction : S.vertexSet → ℕ
  criticalPoints : Set S.vertexSet
  gradientVectorField : Prop
  discreteMorseInequalities : Prop
  homotopyEquivalence : Prop

structure DiscreteMorseEvidence {S : SimplicialComplexPackage} {M : DiscreteMorsePackage S} where
  gradientVectorFieldClosed : M.gradientVectorField
  discreteMorseInequalitiesClosed : M.discreteMorseInequalities
  homotopyEquivalenceClosed : M.homotopyEquivalence

def DiscreteMorseClosed {S : SimplicialComplexPackage} {M : DiscreteMorsePackage S} : Prop :=
  M.gradientVectorField ∧ M.discreteMorseInequalities ∧ M.homotopyEquivalence

theorem discrete_morse_closed_from_evidence {S : SimplicialComplexPackage} {M : DiscreteMorsePackage S}
    (E : DiscreteMorseEvidence M) : DiscreteMorseClosed := by
  exact And.intro E.gradientVectorFieldClosed
    (And.intro E.discreteMorseInequalitiesClosed E.homotopyEquivalenceClosed)

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse
