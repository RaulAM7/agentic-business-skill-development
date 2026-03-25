---
name: customer-mapping
description: >
  Transform a factual Context Document into an interpretive Customer Map using Hormozi
  logic. The critical bridge between raw context and offer design. Produces 6 blocks
  (Avatar Day 1, Avatar Day 90, Obstacle Map, Belief Architecture, Value Equation
  Diagnosis, Transformation Promise) with user validation at each block.
  HIGH interactivity — pauses after every block for user feedback.
---

# Goal

Transform the curated Context Document into a Customer Map that applies Hormozi frameworks to interpret client pain, desires, obstacles, and beliefs. This is the INTERPRETIVE bridge that was missing in v1 — it makes framework application explicit, collaborative, and traceable.

Every interpretive claim carries a confidence tag: `stated` (client said it), `inferred` (logically derived), `hypothesis` (plausible but unconfirmed).

# Inputs

- Context Document: `deals/[NombreDeal]/00-context/context-document.md`
- Template: `shared/templates/01-customer-map.md`
- Knowledge: `shared/knowledge/hormozi_100m_offers.md` (Value Equation, obstacles, guarantees)
- Knowledge: `shared/knowledge/hormozi_and_russell_teoria_unificada.md` (unified framework)

# Output

- `deals/[NombreDeal]/01-customer-map/customer-map.md`

# Core Principles

1. **Extract-first.** Read the entire Context Document before asking any questions. Infer aggressively from the context. Only ask what cannot be deduced and is critical to continue.

2. **Confidence, not certainty.** Every claim carries a tag: `stated`, `inferred`, `hypothesis`. Downstream skills (offer-design) use these tags to weigh decisions. Never present inferences as facts.

3. **Validate per block.** After completing each of the 6 blocks, present to user for validation. Maximum 3 questions per interaction point. Prefer multiple-choice over open-ended. User can adjust, approve, or redirect before the next block.

4. **Interpretation, not invention.** All interpretations must trace back to something in the Context Document. If the context doesn't support an interpretation, mark it as `hypothesis` and state what evidence would confirm or deny it.

# Procedure

## Phase 1 — Absorption

1. Read `deals/[NombreDeal]/00-context/context-document.md` in full.
2. Read template: `shared/templates/01-customer-map.md`.
3. Read knowledge: `shared/knowledge/hormozi_100m_offers.md` (Value Equation sections, obstacle frameworks).
4. Verify context document exists and is reasonably complete. If critical sections are missing, inform user and suggest running context-curation first.

## Phase 2 — Block 1: Avatar Day 1

5. Synthesize from Context Sections 1-2:
   - Current business situation, role, team/resources
   - Emotional state (tag each: `stated` or `inferred`)
   - Previous attempts and their results
   - Nuclear pain statement (one sentence)

6. **INTERACTION GATE:** Present Avatar Day 1 to user.
   - "Does this capture who the client is today?"
   - "Is anything over-weighted or under-weighted?"
   - Wait for approval or adjustment before continuing.

## Phase 3 — Block 2: Avatar Day 90

7. Synthesize from Context Section 5 + Hormozi Day 90 framing:
   - Desired state (3-5 bullets, tagged)
   - Emotional state at Day 90 (tagged)
   - Observable success metrics (tagged)

8. **INTERACTION GATE:** Present Avatar Day 90 to user.
   - "Is this how the client imagines success?"
   - "Is anything missing from their vision?"
   - Wait for approval or adjustment.

## Phase 4 — Block 3: Obstacle Map

9. Reframe Context Section 2 problems as Hormozi obstacles:
   - Assign strategic weight (1-5) based on: impact on value equation, perceived urgency, growth blockage
   - Classify type: operativo / emocional / estructural
   - Tag confidence level
   - Explain prioritization logic

10. **INTERACTION GATE:** Present Obstacle Map to user.
    - "I've prioritized these obstacles by [criterion]. Do you agree with the ranking?"
    - "Is any key obstacle missing?"
    - Wait for approval or adjustment.

## Phase 5 — Block 4: Belief Architecture

11. Analyze Context Section 4 beliefs through Hormozi lens:
    - Identify the Big Domino: "If the client believes [mechanism], then buying [offer] becomes obvious"
    - Classify as New Opportunity or Opportunity Switch
    - List enabling beliefs (facilitate the sale)
    - List blocking beliefs (could prevent decision) with proposed strategy to address each

12. **INTERACTION GATE:** Present Belief Architecture to user.
    - "I've identified [X] as the Big Domino. Does this resonate?"
    - "Are there beliefs I'm missing that could block the sale?"
    - Wait for approval or adjustment.

## Phase 6 — Block 5: Value Equation Diagnosis

13. Score preliminary state of each Value Equation factor:
    - Dream Outcome: how clear/attractive is the result?
    - Perceived Likelihood: how believable is achievement?
    - Time Delay: how long does the client expect to wait?
    - Effort & Sacrifice: how much does it cost the client?
14. For each factor: current state, opportunity, priority (Alta/Media/Baja).
15. Write recommendation for offer design: where to focus to maximize perceived value.

(No interaction gate here — this is analytical, presented together with Block 6.)

## Phase 7 — Block 6: Transformation Promise Draft

16. Generate 3 variants in "De A a B en Z dias sin X, via Y" format:
    - Variante 1: outcome-focused
    - Variante 2: pain-first
    - Variante 3: identity-focused

17. **INTERACTION GATE:** Present all 3 variants + Value Equation Diagnosis to user.
    - "Which direction best captures the promise?"
    - "Or is there a combination that works better?"
    - Wait for selection.

## Phase 8 — Completion

18. Assemble the final Customer Map document using template structure.
19. Verify all confidence tags are present.
20. Verify no claims lack traceability to the Context Document.
21. Verify completion checklist:
    - All 6 blocks complete
    - All blocks validated by user
    - All claims tagged (stated/inferred/hypothesis)
    - Transformation Promise variant selected
22. Save to `deals/[NombreDeal]/01-customer-map/customer-map.md`.
23. Summarize: "Customer Map complete. Key insights: [2-3 bullets]. Ready for offer-design."

# Anti-patterns

- Presenting all 6 blocks at once without per-block validation. The value of this skill is the collaborative interpretation — skipping interaction gates defeats the purpose.
- Tagging everything as `stated` to avoid scrutiny. Be honest about what is inferred or hypothetical.
- Applying frameworks without tracing back to context. Every interpretation should reference what in the Context Document supports it.
- Asking more than 3 questions per interaction gate. Keep it focused — prefer multiple-choice.
- Treating the Value Equation Diagnosis as final. It is preliminary — offer-design will refine it.
- Skipping the Big Domino identification. This is the single most important interpretive output for offer design.
- Writing the Customer Map without reading the knowledge files. The Hormozi frameworks inform how to interpret, not what to invent.
