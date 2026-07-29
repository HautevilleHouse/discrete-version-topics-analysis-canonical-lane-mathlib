import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

structure DiscreteTimePackage where
  timeStep : Type u
  stepCount : Nat
  initialCondition : Prop
  recurrenceRelation : Prop
  stabilityCondition : Prop

structure DiscreteTimeEvidence (D : DiscreteTimePackage) where
  initialConditionClosed : D.initialCondition
  recurrenceRelationClosed : D.recurrenceRelation
  stabilityConditionClosed : D.stabilityCondition

def DiscreteTimeClosed (D : DiscreteTimePackage) : Prop :=
  D.initialCondition ∧ D.recurrenceRelation ∧ D.stabilityCondition

theorem discrete_time_closed_from_evidence (D : DiscreteTimePackage)
    (E : DiscreteTimeEvidence D) : DiscreteTimeClosed D := by
  exact And.intro E.initialConditionClosed
    (And.intro E.recurrenceRelationClosed E.stabilityConditionClosed)

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse