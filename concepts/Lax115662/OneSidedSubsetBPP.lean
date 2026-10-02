import Lax115662.RandomizedPolynomialTime
import Lax115662.OneSidedError

/-!
---
title: RP and coRP are contained in BPP
type: theorem
---
The one-sided-error classes satisfy
$\mathrm{RP}\cup\mathrm{coRP}\subseteq\mathrm{BPP}$.
Their one-sided guarantees imply correctness with probability at least
$2/3$ on every input.
-/

namespace Lax115662.OneSidedSubsetBPP

open RandomizedPolynomialTime OneSidedError

axiom RP_union_coRP_subset_BPP : RP ∪ coRP ⊆ BPP

end Lax115662.OneSidedSubsetBPP
