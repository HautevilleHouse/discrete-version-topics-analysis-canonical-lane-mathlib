import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

structure WeightedGraph (V : Type) where
  n : Nat
  vertices : Fin n → V
  adjacency : Matrix (Fin n) (Fin n) ℝ
  isSymmetric : adjacency = adjacencyᵀ
  nonnegative : ∀ i j : Fin n, adjacency i j ≥ 0

structure GraphLaplacian {V : Type} (G : WeightedGraph V) where
  D : Matrix (Fin G.n) (Fin G.n) ℝ
  L : Matrix (Fin G.n) (Fin G.n) ℝ
  degreeMatrixDefined : D = Matrix.diag (λ i => ∑ j : Fin G.n, G.adjacency i j)
  laplacianDefined : L = D - G.adjacency
  positiveSemidefinite : Matrix.PosSemidef L
  kernelContainsConstantVector : L.mulVec (λ _ => 1) = 0

structure GraphLaplacianEvidence {V : Type} {G : WeightedGraph V} (Lap : GraphLaplacian G) where
  degreeMatrixClosed : Lap.degreeMatrixDefined
  laplacianClosed : Lap.laplacianDefined
  psdClosed : Lap.positiveSemidefinite
  constantKernelClosed : Lap.kernelContainsConstantVector

def GraphLaplacianClosed {V : Type} {G : WeightedGraph V} (Lap : GraphLaplacian G) : Prop :=
  Lap.degreeMatrixDefined ∧ Lap.laplacianDefined ∧ Lap.positiveSemidefinite ∧ Lap.kernelContainsConstantVector

theorem graph_laplacian_closed_from_evidence {V : Type} {G : WeightedGraph V} (Lap : GraphLaplacian G) (E : GraphLaplacianEvidence Lap) : GraphLaplacianClosed Lap :=
  And.intro E.degreeMatrixClosed (And.intro E.laplacianClosed (And.intro E.psdClosed E.constantKernelClosed))

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse