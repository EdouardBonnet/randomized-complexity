import Lax666725.ProbabilisticMachines

/-!
---
title: The complexity class BPP
type: definition
---
A binary language belongs to $\mathrm{BPP}$ if a probabilistic Turing
machine, running in polynomial time on every branch, answers correctly
with probability at least $2/3$ on every input. Both false acceptance and
false rejection are allowed, each with probability at most $1/3$ on the
corresponding inputs. Languages are exactly those of
`Lax434930.PolynomialTime.Language`.
-/

namespace Lax666725.RandomizedPolynomialTime

open Lax434930.PolynomialTime ProbabilisticMachines

def BPP : Set Language :=
  {L | ∃ A : Procedure Bool, ∀ x, (2 / 3 : ℚ) ≤ A.probability x (Correct L x)}

end Lax666725.RandomizedPolynomialTime
