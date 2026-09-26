import Lax666725.ProbabilisticMachines

/-!
---
title: The complexity class PP
type: definition
---
A binary language belongs to $\mathrm{PP}$ if a polynomial-time
probabilistic machine answers correctly with probability strictly greater
than $1/2$ on every input. No constant or inverse-polynomial lower bound
on the advantage over $1/2$ is imposed. We use the strict-correctness
convention on both members and nonmembers; ties do not count as success.
-/

namespace Lax666725.UnboundedError

open Lax434930.PolynomialTime ProbabilisticMachines

def PP : Set Language :=
  {L | ∃ A : Procedure Bool, ∀ x, (1 / 2 : ℚ) < A.probability x (Correct L x)}

end Lax666725.UnboundedError
