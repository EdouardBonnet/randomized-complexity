import Lax666725.RandomizedPolynomialTime
import Lax666725.ZeroError

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

namespace Lax666725.ZPPSubsetBPP

open RandomizedPolynomialTime ZeroError

axiom ZPP_subset_BPP : ZPP ⊆ BPP

end Lax666725.ZPPSubsetBPP
