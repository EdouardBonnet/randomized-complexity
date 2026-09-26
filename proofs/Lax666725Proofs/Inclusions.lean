import Lax666725.Inclusions
import Mathlib.Tactic

namespace Lax666725Proofs

open Lax434930.PolynomialTime
open Lax666725 ProbabilisticMachines RandomizedPolynomialTime OneSidedError ZeroError UnboundedError

/-- Relabeling terminal states does not change any transition or running time. -/
def relabel {α β : Type} (A : Procedure α) (f : α → β) : Procedure β where
  machine := A.machine
  time := A.time
  output := f ∘ A.output
  halts := A.halts

lemma probability_mono {α : Type} (A : Procedure α) (x : Word) (E F : α → Prop)
    (h : ∀ r, E (A.eval x r) → F (A.eval x r)) :
    A.probability x E ≤ A.probability x F := by
  classical
  apply div_le_div_of_nonneg_right _ (Nat.cast_nonneg _)
  exact_mod_cast Finset.card_le_card (show
    Finset.univ.filter (fun r : A.Coins x => E (A.eval x r)) ⊆
    Finset.univ.filter (fun r : A.Coins x => F (A.eval x r)) from by
      intro r hr
      exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, h r (Finset.mem_filter.mp hr).2⟩)

lemma probability_one {α : Type} (A : Procedure α) (x : Word) (E : α → Prop)
    (h : ∀ r, E (A.eval x r)) : A.probability x E = 1 := by
  classical
  simp [Procedure.probability, h]

lemma correct_not (L : Language) (x : Word) (b : Bool) :
    Correct Lᶜ x (!b) ↔ Correct L x b := by
  cases b <;> simp [Correct]

lemma zpp_subset_rp : ZPP ⊆ RP := by
  rintro L ⟨A, hA⟩
  refine ⟨relabel A (fun a => a.getD false), ?_⟩
  intro x
  obtain ⟨hsafe, hsuccess⟩ := hA x
  constructor
  · intro r hr
    change (A.eval x r).getD false = true at hr
    cases ha : A.eval x r with
    | none => simp [ha] at hr
    | some b =>
      have hb : b = true := by simpa [ha] using hr
      exact (hsafe r b ha).mp hb
  · intro hx
    change (2 / 3 : ℚ) ≤ A.probability x (fun a => a.getD false = true)
    apply hsuccess.trans (probability_mono A x _ _ ?_)
    intro r hr
    cases ha : A.eval x r with
    | none => simp [ha] at hr
    | some b => simpa [ha] using (hsafe r b ha).mpr hx

lemma zpp_complement {L : Language} (hL : L ∈ ZPP) : Lᶜ ∈ ZPP := by
  obtain ⟨A, hA⟩ := hL
  refine ⟨relabel A (Option.map Bool.not), ?_⟩
  intro x
  obtain ⟨hsafe, hsuccess⟩ := hA x
  constructor
  · intro r b hr
    change (A.eval x r).map Bool.not = some b at hr
    cases ha : A.eval x r with
    | none => simp [ha] at hr
    | some c =>
      have hb : (!c) = b := by simpa [ha] using hr
      rw [← hb]
      exact (correct_not L x c).mpr (hsafe r c ha)
  · change (2 / 3 : ℚ) ≤ A.probability x (fun a => (a.map Bool.not).isSome = true)
    simpa only [Option.isSome_map] using hsuccess

/--
---
conclusion: Lax666725.Inclusions.ZPP_subset_RP_inter_coRP
---
Replace failure by rejection. Applying the same construction after
complementing every definite answer gives the coRP witness.
-/
theorem ZPP_subset_RP_inter_coRP : ZPP ⊆ RP ∩ coRP := by
  intro L hL
  exact ⟨zpp_subset_rp hL, zpp_subset_rp (zpp_complement hL)⟩

lemma rp_subset_bpp : RP ⊆ BPP := by
  rintro L ⟨A, hA⟩
  refine ⟨A, ?_⟩
  intro x
  obtain ⟨hsafe, hsuccess⟩ := hA x
  by_cases hx : x ∈ L
  · apply (hsuccess hx).trans (probability_mono A x _ _ ?_)
    intro r hr
    exact ⟨fun _ => hx, fun _ => hr⟩
  · have hall : ∀ r, Correct L x (A.eval x r) := by
      intro r
      exact ⟨fun hr => (hx (hsafe r hr)).elim, fun h => (hx h).elim⟩
    rw [probability_one A x _ hall]
    norm_num

lemma bpp_complement {L : Language} (hL : L ∈ BPP) : Lᶜ ∈ BPP := by
  obtain ⟨A, hA⟩ := hL
  refine ⟨relabel A Bool.not, ?_⟩
  intro x
  change (2 / 3 : ℚ) ≤ A.probability x (fun b => Correct Lᶜ x (!b))
  simpa only [correct_not] using hA x

/--
---
conclusion: Lax666725.Inclusions.RP_union_coRP_subset_BPP
---
One-sided correctness implies bounded two-sided correctness. Complementing
the output exchanges the two one-sided conventions.
-/
theorem RP_union_coRP_subset_BPP : RP ∪ coRP ⊆ BPP := by
  intro L hL
  rcases hL with hL | hL
  · exact rp_subset_bpp hL
  · simpa only [compl_compl] using bpp_complement (rp_subset_bpp hL)

/--
---
conclusion: Lax666725.Inclusions.ZPP_subset_BPP
---
Compose the proved inclusion into RP with the proved bounded-error inclusion.
-/
theorem ZPP_subset_BPP : ZPP ⊆ BPP := by
  intro L hL
  exact Inclusions.RP_union_coRP_subset_BPP
    (Or.inl (Inclusions.ZPP_subset_RP_inter_coRP hL).1)

/--
---
conclusion: Lax666725.Inclusions.BPP_subset_PP
---
The bounded-error success probability exceeds one half.
-/
theorem BPP_subset_PP : BPP ⊆ PP := by
  rintro L ⟨A, hA⟩
  exact ⟨A, fun x => lt_of_lt_of_le (by norm_num) (hA x)⟩

end Lax666725Proofs
