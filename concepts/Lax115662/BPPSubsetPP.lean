import Lax115662.RandomizedPolynomialTime
import Lax115662.UnboundedError

/-!
---
title: BPP is contained in PP
type: theorem
---
Bounded-error polynomial time is contained in unbounded-error polynomial
time: $\mathrm{BPP}\subseteq\mathrm{PP}$.
The same procedure witnesses the inclusion, since $2/3>1/2$.
-/

namespace Lax115662.BPPSubsetPP

open RandomizedPolynomialTime UnboundedError

axiom BPP_subset_PP : BPP ⊆ PP

end Lax115662.BPPSubsetPP
