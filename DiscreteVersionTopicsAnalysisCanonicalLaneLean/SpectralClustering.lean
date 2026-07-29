import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

structure SpectralClusteringResult (n : ℕ) where
  eigenvectors : Matrix (Fin n) (Fin n) ℝ
  eigenvalues : Fin n → ℝ
  clusteringAssignment : Fin n → ℕ
  numberOfClusters : ℕ
  partitionDefined : ∀ i j : Fin n, clusteringAssignment i = clusteringAssignment j → similarColors i j
  where
    similarColors : Fin n → Fin n → Prop := λ a b => True
  clustersConnected : ∀ C : Set (Fin n), (∀ i ∈ C, clusteringAssignment i = clusteringAssignment (someElement C)) → Connected C
  where
    someElement : Set (Fin n) → Fin n := λ s => if h : s.Nonempty then h.choose else ⟨0, by omega⟩

structure SpectralClusteringEvidence (n : ℕ) (S : SpectralClusteringResult n) where
  partitionClosed : S.partitionDefined
  clustersConnectedClosed : S.clustersConnected

def SpectralClusteringClosed (n : ℕ) (S : SpectralClusteringResult n) : Prop :=
  S.partitionDefined ∧ S.clustersConnected

theorem spectral_clustering_closed_from_evidence (n : ℕ) (S : SpectralClusteringResult n) (E : SpectralClusteringEvidence n S) : SpectralClusteringClosed n S :=
  And.intro E.partitionClosed E.clustersConnectedClosed

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse