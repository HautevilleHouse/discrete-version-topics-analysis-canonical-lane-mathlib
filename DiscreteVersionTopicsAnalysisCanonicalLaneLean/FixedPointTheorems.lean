import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

structure FixedPointTheorem (α : Type) [CompleteLattice α] where
  f : α → α
  monotone : Monotone f
  leastFixedPoint : α
  greatestFixedPoint : α
  leastFixedPointProperty : f leastFixedPoint = leastFixedPoint ∧ ∀ x, f x = x → leastFixedPoint ≤ x
  greatestFixedPointProperty : f greatestFixedPoint = greatestFixedPoint ∧ ∀ x, f x = x → x ≤ greatestFixedPoint

structure FixedPointTheoremEvidence (F : FixedPointTheorem (Set ℕ)) where
  monotoneClosed : F.monotone
  leastFPClosed : F.f F.leastFixedPoint = F.leastFixedPoint
  greatestFPClosed : F.f F.greatestFixedPoint = F.greatestFixedPoint

def FixedPointTheoremClosed (F : FixedPointTheorem (Set ℕ)) : Prop :=
  F.monotone ∧ F.f F.leastFixedPoint = F.leastFixedPoint ∧ F.f F.greatestFixedPoint = F.greatestFixedPoint

theorem fixed_point_theorem_closed_from_evidence (F : FixedPointTheorem (Set ℕ)) (E : FixedPointTheoremEvidence F) : FixedPointTheoremClosed F :=
  And.intro E.monotoneClosed (And.intro E.leastFPClosed E.greatestFPClosed)

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse