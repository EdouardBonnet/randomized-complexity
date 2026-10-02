import Lax115662.RandomizedPolynomialTime
import Lax115662.ZeroError

/-!
---
title: ZPP is contained in BPP
type: theorem
---
Zero-error polynomial time is contained in bounded-error polynomial time:
$\mathrm{ZPP}\subseteq\mathrm{BPP}$.
The proof combines the inclusion of ZPP in RP with the inclusion of the
one-sided-error classes in BPP.
-/

namespace Lax115662.ZPPSubsetBPP

open RandomizedPolynomialTime ZeroError

axiom ZPP_subset_BPP : ZPP ⊆ BPP

end Lax115662.ZPPSubsetBPP
