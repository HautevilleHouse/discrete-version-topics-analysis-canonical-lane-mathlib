import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

structure DiscreteTopologyPackage where
  carrier : Type u
  opens : Set (Set carrier)
  openUnion : ∀ (U : Set (Set carrier)), U ⊆ opens → ⋃₀ U ∈ opens
  openInter : ∀ (U V : Set carrier), U ∈ opens → V ∈ opens → U ∩ V ∈ opens
  emptyOpen : ∅ ∈ opens
  wholeOpen : Set.univ ∈ opens

structure DiscreteTopologyEvidence (T : DiscreteTopologyPackage) where
  openUnionClosed : T.openUnion
  openInterClosed : T.openInter
  emptyOpenClosed : T.emptyOpen
  wholeOpenClosed : T.wholeOpen

def DiscreteTopologyClosed (T : DiscreteTopologyPackage) : Prop :=
  T.openUnion ∧ T.openInter ∧ T.emptyOpen ∧ T.wholeOpen

theorem discrete_topology_closed_from_evidence (T : DiscreteTopologyPackage) (E : DiscreteTopologyEvidence T) :
    DiscreteTopologyClosed T := by
  exact And.intro E.openUnionClosed (And.intro E.openInterClosed (And.intro E.emptyOpenClosed E.wholeOpenClosed))

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse