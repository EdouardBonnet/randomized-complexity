import Lax666725.ProbabilisticMachines

/-!
---
title: The complexity class ZPP
type: definition
---
A binary language belongs to $\mathrm{ZPP}$ if a polynomial-time
probabilistic machine may answer $0$, $1$, or "don't know", every definite
answer is correct, and a definite answer occurs with probability at least
$2/3$ on every input. The time bound holds on every branch, including
branches that answer "don't know".

This is the bounded-time, failure-allowed definition of zero-error
polynomial time. Its familiar expected-polynomial-time characterization
uses repeated independent trials until a definite answer is obtained;
the equivalence of these characterizations is not a theorem of this
submission. Here `none` denotes "don't know" and `some b` a definite answer.
-/

namespace Lax666725.ZeroError

open Lax434930.PolynomialTime ProbabilisticMachines

def ZPP : Set Language :=
  {L | ∃ A : Procedure (Option Bool), ∀ x,
    (∀ r b, A.eval x r = some b → Correct L x b) ∧
    (2 / 3 : ℚ) ≤ A.probability x (fun a => a.isSome = true)}

end Lax666725.ZeroError
