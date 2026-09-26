import Lax666725.ProbabilisticMachines

/-!
---
title: The complexity classes RP and coRP
type: definition
---
A binary language belongs to $\mathrm{RP}$ if a polynomial-time
probabilistic machine never accepts a nonmember and accepts each member
with probability at least $2/3$. It belongs to $\mathrm{coRP}$ if its
complement belongs to $\mathrm{RP}$.

The success threshold $2/3$ is a standard constant-error convention for
$\mathrm{RP}$; it gives the same class as the customary threshold $1/2$.
The complement is taken among binary words, not among languages.
-/

namespace Lax666725.OneSidedError

open Lax434930.PolynomialTime ProbabilisticMachines

def RP : Set Language :=
  {L | ∃ A : Procedure Bool, ∀ x,
    (∀ r, A.eval x r = true → x ∈ L) ∧
    (x ∈ L → (2 / 3 : ℚ) ≤ A.probability x (fun b => b = true))}

def coRP : Set Language := {L | Lᶜ ∈ RP}

end Lax666725.OneSidedError
