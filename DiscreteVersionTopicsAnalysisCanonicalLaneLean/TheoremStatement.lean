import DiscreteVersionTopicsAnalysisCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace DiscreteVersionTopicsAnalysisCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  discreteConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String
deriving Repr, DecidableEq

def sourceTheoremStatement : TheoremStatement :=
  { sourceKey := "discrete-version-topics-analysis-canonical-lane",
    theoremName := "Discrete Version Topics Analysis",
    theoremObject := "Admissible discrete structure identified via discrete analysis",
    classicalBoundary := "classical-closure-boundary",
    discreteConstrainedStatement := "manifold-constrained theorem certificate internalized through discrete analysis",
    certificateLane := "discrete_constrained",
    carriedRemainder := "carried classical boundary carried by formalization" }

theorem theorem_statement_source_key_checked : sourceTheoremStatement.sourceKey = "discrete-version-topics-analysis-canonical-lane" := by rfl

end DiscreteVersionTopicsAnalysisCanonicalLaneLean
end HautevilleHouse