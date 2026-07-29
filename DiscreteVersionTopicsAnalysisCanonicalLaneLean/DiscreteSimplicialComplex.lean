import DiscreteVersionTopicsAnalysisCanonicalLaneLean.DiscreteAdmissibleClass

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

structure SimplicialComplexPackage where
  vertexSet : Type
  simplicialSet : Set (List vertexSet)
  faceDecomposition : Prop
  dimensionConsistent : Prop
  homotopyTypeRecovered : Prop

structure SimplicialComplexEvidence (S : SimplicialComplexPackage) where
  faceDecompositionClosed : S.faceDecomposition
  dimensionConsistentClosed : S.dimensionConsistent
  homotopyTypeRecoveredClosed : S.homotopyTypeRecovered

def SimplicialComplexClosed (S : SimplicialComplexPackage) : Prop :=
  S.faceDecomposition ∧ S.dimensionConsistent ∧ S.homotopyTypeRecovered

theorem simplicial_complex_closed_from_evidence (S : SimplicialComplexPackage)
    (E : SimplicialComplexEvidence S) : SimplicialComplexClosed S := by
  exact And.intro E.faceDecompositionClosed
    (And.intro E.dimensionConsistentClosed E.homotopyTypeRecoveredClosed)

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse
