# Randomized Complexity Classes

Lax submission `lax-666725`, using the binary language type
`Lax434930.PolynomialTime.Language` from
[Classical Complexity Classes](https://laxarchive.org/lax-434930/).

| Class | Guarantee on each input |
| --- | --- |
| RP | No false acceptance; acceptance probability at least 2/3 on members |
| coRP | The complement language belongs to RP |
| BPP | Correct answer with probability at least 2/3 |
| ZPP | Every definite answer is correct; “don't know” probability at most 1/3 |
| PP | Correct answer with probability strictly greater than 1/2 |

Every witness has finite control and a finite tape alphabet. Each elementary
transition chooses between two local transition tables using a fresh fair bit.
The tables agree on halting. A single polynomial bounds the running time on
every input and every coin sequence. Probability is an exact rational count
over all bit strings of that polynomial length, padding halted runs by idle
steps. The finite control state determines the output, so changing the output
labels requires no additional computation.

ZPP uses the standard bounded-time definition with an explicit failure answer.
The equivalence with expected polynomial time, threshold amplification, and
the reverse inclusion RP ∩ coRP ⊆ ZPP are outside the proved scope. PP uses
strict correctness on both sides of the language; it has no promised lower
bound on the advantage over 1/2.

The four submitted theorems are:

- ZPP ⊆ RP ∩ coRP;
- RP ∪ coRP ⊆ BPP;
- ZPP ⊆ BPP;
- BPP ⊆ PP.

The requested ZPP ⊆ BPP theorem explicitly depends on the first two theorems
in the Lax proof network. Their proofs, and the proof of BPP ⊆ PP, use only
Mathlib and the definitions. No statement from the classical complexity
submission is assumed, including its open P versus NP question.

The definitions follow the conventions of
[Jonathan Katz's Lecture 12](https://www.cs.umd.edu/~jkatz/complexity/f11/lecture12.pdf),
with 2/3 as the common fixed success threshold for RP, BPP, and ZPP.

Build and inspect the submission with:

```sh
lax build . --replay
node scripts/audit-proof-closure.mjs .
lax serve .
```
