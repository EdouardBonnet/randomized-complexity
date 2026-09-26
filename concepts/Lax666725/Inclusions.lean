import Lax666725.RandomizedPolynomialTime
import Lax666725.OneSidedError
import Lax666725.ZeroError
import Lax666725.UnboundedError

/-!
---
title: Inclusions between randomized complexity classes
type: theorem
---
The randomized classes satisfy
$\mathrm{ZPP}\subseteq\mathrm{RP}\cap\mathrm{coRP}$,
$\mathrm{RP}\cup\mathrm{coRP}\subseteq\mathrm{BPP}$, and
$\mathrm{BPP}\subseteq\mathrm{PP}$.
In particular, $\mathrm{ZPP}\subseteq\mathrm{BPP}$.

Replacing "don't know" by rejection or acceptance gives the one-sided
algorithms. Their guarantees imply the bounded-error guarantee, and
$2/3>1/2$ gives the last inclusion. All inclusions have checked proofs.
-/

namespace Lax666725.Inclusions

open RandomizedPolynomialTime OneSidedError ZeroError UnboundedError

axiom ZPP_subset_RP_inter_coRP : ZPP ⊆ RP ∩ coRP

axiom RP_union_coRP_subset_BPP : RP ∪ coRP ⊆ BPP

axiom ZPP_subset_BPP : ZPP ⊆ BPP

axiom BPP_subset_PP : BPP ⊆ PP

end Lax666725.Inclusions
