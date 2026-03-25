---
name: proposal-critique
description: >
  Analyze a completed proposal from the perspective of an implacable buyer/negotiator.
  Produces a diagnostic with weighted scorecard, bottleneck checklist, improvement
  playbook, concrete rewrites, and offer-to-proposal fidelity check. LOW interactivity
  — diagnostic output, user reads and decides. Use after template-formatting is complete.
---

# Goal

Evaluate a completed business proposal from the buyer's perspective — not as a friendly reviewer, but as an implacable procurement negotiator looking for leverage, weaknesses, and reasons to demand concessions. Produce a comprehensive diagnostic that identifies what works, what fails, and exactly how to fix it.

# Inputs

- Context Document: `deals/[NombreDeal]/00-context/context-document.md`
- Offer Design: `deals/[NombreDeal]/02-offer/offer-design.md`
- Proposal: `deals/[NombreDeal]/03-proposal/proposal.md`
- Scorecard reference: `shared/references/critique-scorecard.md`
- Bottleneck checklist: `shared/references/bottleneck-checklist.md`
- Template: `shared/templates/04-proposal-critique.md`

# Output

- `deals/[NombreDeal]/04-evaluation/proposal-critique.md`

# Core Principles

1. **Buyer's perspective, not seller's.** Adopt the mindset of "un negociador de contratacion y compras implacable." Look for: leverage extraction points, pricing weaknesses, desperation signals, ambiguity that can be exploited, missing proof, weak guarantees. This is not surface copy critique — it is deep negotiation analysis.

2. **Evidence-based scoring.** Every score in the scorecard must cite specific evidence from the proposal document. No vague justifications like "could be stronger" — point to the exact section, sentence, or absence that justifies the score.

3. **Fixes are concrete.** The Improvement Playbook does not say "improve the guarantee." It says "In Section 8.1, replace the current guarantee text with a specific stress-test mechanism that tests [X] before go-live, with binary pass/fail criteria and full refund if fail." Rewrites provide actual replacement text.

4. **Fidelity matters.** Check whether the proposal faithfully translates the offer. Missing elements, weakened language, or inconsistencies between offer and proposal are critical findings.

# Procedure

## Phase 1 — Absorption

1. Read `deals/[NombreDeal]/03-proposal/proposal.md` in full.
2. Read `deals/[NombreDeal]/02-offer/offer-design.md` in full.
3. Read `deals/[NombreDeal]/00-context/context-document.md` in full.
4. Read scorecard reference: `shared/references/critique-scorecard.md`.
5. Read bottleneck checklist: `shared/references/bottleneck-checklist.md`.
6. Read template: `shared/templates/04-proposal-critique.md`.

## Phase 2 — Section A: Exec Summary

7. Identify the 3 biggest strengths with evidence.
8. Identify the 3 biggest weaknesses with negotiation impact.
9. Identify the 3 highest-leverage fixes (changes that would most improve conversion).

## Phase 3 — Section B: Scorecard

10. Score each of the 10 criteria (1-10 scale):

    **Value Equation (60% weight):**
    - Dream Outcome claro y especifico (12%)
    - Perceived Likelihood: mecanismo + plan + control (18%)
    - Time Delay reducido: time-to-value (12%)
    - Effort & Sacrifice reducido: friccion (10%)
    - Value Stack / percepcion de deal (8%)

    **Proposal That Converts (40% weight):**
    - Deliverables especificos + criterios de aceptacion (10%)
    - Scope y limites (8%)
    - Proof / credibilidad (8%)
    - Risk reversal / safeguards (8%)
    - Buying friction: pricing + next steps (6%)

11. For each criterion: score with specific evidence from the document.
12. Calculate weighted total using the formula from critique-scorecard.md.
13. List all fragilities (criteria scoring below 6).

## Phase 4 — Section C: Bottleneck Checklist

14. Run the 9 binary checks from bottleneck-checklist.md:
    1. One-liner A to B in Z without X
    2. Why believe? (mechanism + steps + success criteria)
    3. Time-to-value (quick win 7-14 days)
    4. "What do I have to do?" (client inputs + DFY clarity)
    5. Auditable deliverables ("done when...")
    6. Scope + not included + change process
    7. Proof (1-3 hard assets)
    8. Risk reversal (conditional guarantee/test/remedy)
    9. Pricing + decision + next steps

15. For each: PASS, PARTIAL, or FAIL with specific evidence.
16. Count totals. Interpret: 7+ PASS = ready; 4-6 = needs fixes; <4 = significant revision.

## Phase 5 — Section D: Improvement Playbook

17. Identify top 10-12 fixes ordered by leverage (highest impact first).
18. For each fix:
    - **Diagnosis:** What is wrong (specific)
    - **Impact:** Why it weakens the proposal (negotiation/conversion perspective)
    - **Concrete change:** Exactly what to do
    - **Where:** Which section of the proposal

## Phase 6 — Section E: Rewrites

19. For the 3-5 weakest sections, produce concrete rewrite blocks.
20. Each rewrite is actual replacement text the user can copy-paste.
21. Provide 2-3 variants for the most critical rewrite.

## Phase 7 — Section F: Translation Check

22. Compare Offer Design to Proposal systematically:
    - Items successfully translated (3-5 elements)
    - Items missing or weakly translated (3-5 elements)
    - Inconsistencies between offer and proposal (data, metrics, claims that don't match)

## Phase 8 — Completion

23. Write summary: weighted score, 2-3 sentence executive assessment, estimated impact of applying fixes.
24. Assemble full document using template structure.
25. Save to `deals/[NombreDeal]/04-evaluation/proposal-critique.md`.
26. Present key findings to user: "Proposal scored [X]/10. [Y] bottleneck checks passed. Top 3 fixes: [list]. Full diagnostic saved."

# Anti-patterns

- Friendly, surface-level critique. This is a buyer's negotiation analysis, not a peer review. Be ruthless.
- Scores without evidence. "7/10 — solid" is useless. Cite the exact section and quote.
- Generic fix recommendations. "Improve the guarantee" is not actionable. Specify the exact change.
- Skipping the translation check. Offer-to-proposal fidelity is where silent value loss happens.
- Producing the critique without reading all three source documents. Context informs what the client actually said; offer informs what was promised; proposal is what's being delivered.
- Rewrites that change the strategic direction. Rewrites improve the proposal's execution, not the offer's strategy. If the strategy is wrong, that's feedback for offer-design.
