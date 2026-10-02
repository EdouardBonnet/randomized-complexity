import Lax115662.OneSidedError
import Lax115662.ZeroError

/-!
---
title: ZPP is contained in RP and coRP
type: theorem
---
Every zero-error polynomial-time language belongs to both one-sided-error
classes: $\mathrm{ZPP}\subseteq\mathrm{RP}\cap\mathrm{coRP}$.
Replacing "don't know" by rejection gives an RP procedure; replacing it
by acceptance gives a coRP procedure.
-/

namespace Lax115662.ZPPSubsetOneSided

open OneSidedError ZeroError

axiom ZPP_subset_RP_inter_coRP : ZPP ⊆ RP ∩ coRP

end Lax115662.ZPPSubsetOneSided
