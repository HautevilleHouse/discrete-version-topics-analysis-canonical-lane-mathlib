import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

structure LatticeOperator (α : Type) [PartialOrder α] where
  op : α → α → α
  idempotent : ∀ x : α, op x x = x
  commutative : ∀ x y : α, op x y = op y x
  associative : ∀ x y z : α, op x (op y z) = op (op x y) z
  absorbing : ∀ x y : α, op x (op x y) = op x y

def meetOperator (α : Type) [SemilatticeInf α] : LatticeOperator α :=
  { op := (· ⊓ ·)
    idempotent := inf_idem
    commutative := inf_comm
    associative := inf_assoc
    absorbing := λ x y => inf_le_inf_left x (by exact le_of_eq rfl) }

def joinOperator (α : Type) [SemilatticeSup α] : LatticeOperator α :=
  { op := (· ⊔ ·)
    idempotent := sup_idem
    commutative := sup_comm
    associative := sup_assoc
    absorbing := λ x y => sup_le_sup_left (by exact le_refl _) _ }

structure LatticeOperatorEvidence (L : LatticeOperator ℕ) where
  idempotentClosed : L.idempotent 0 0
  commutativeClosed : L.commutative 0 1
  associativeClosed : L.associative 0 1 2
  absorbingClosed : L.absorbing 0 1

def LatticeOperatorClosed (L : LatticeOperator ℕ) : Prop :=
  L.idempotent 0 0 ∧ L.commutative 0 1 ∧ L.associative 0 1 2 ∧ L.absorbing 0 1

theorem lattice_operator_closed_from_evidence (L : LatticeOperator ℕ) (E : LatticeOperatorEvidence L) : LatticeOperatorClosed L :=
  And.intro E.idempotentClosed (And.intro E.commutativeClosed (And.intro E.associativeClosed E.absorbingClosed))

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse