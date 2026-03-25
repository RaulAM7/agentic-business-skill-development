---
name: offer-design
description: >
  Design a Hormozi Grand Slam offer from Context Document + Customer Map. Applies
  Value Equation systematically across 12 sections. HIGH interactivity — pauses at
  strategy direction, stack design, plan architecture, and guarantee for user validation.
  Produces offer document + self-critique. Use after customer-mapping is complete.
---

# Goal

Design a complete Grand Slam offer that maximizes perceived value using Hormozi's Value Equation. Transform the factual context and interpretive customer map into a structured 12-section offer with plans, guarantee, pricing logic, and strategic narrative.

Every strategic design choice is tagged: `grounded` (based on customer map) or `proposed` (skill's recommendation).

# Inputs

- Context Document: `deals/[NombreDeal]/00-context/context-document.md`
- Customer Map: `deals/[NombreDeal]/01-customer-map/customer-map.md`
- Template: `shared/templates/02-offer-design.md`
- Scoring rubric: `shared/references/scoring-rubric.md`
- Knowledge: `shared/knowledge/hormozi_100m_offers.md`

# Output

- `deals/[NombreDeal]/02-offer/offer-design.md`
- `deals/[NombreDeal]/scratch/offer-self-critique.md`

# Core Principles

1. **Customer Map first.** The Customer Map is your primary design input — it contains the interpreted obstacles, beliefs, Value Equation diagnosis, and transformation promise that drive every offer decision. The Context Document provides supporting detail and quotes.

2. **Design choices are traceable.** Every significant offer decision (stack composition, plan architecture, guarantee mechanism, pricing logic) is tagged as `grounded` (derived from customer map) or `proposed` (your strategic recommendation). This lets the user distinguish evidence-based decisions from creative suggestions.

3. **User validates before commitment.** Do NOT produce the full 12-section document in one pass. Pause at 4 key decision points for user input. This prevents wasted work on wrong directions and makes the user a co-designer.

4. **Self-critique is mandatory.** After completing the offer, produce a self-critique using the 6-criteria scoring rubric. This is a required output, not optional.

5. **Conservative on guarantees.** Guarantee must be objectively deliverable (stress-test passable), not aspirational. Address the core fear from the Context Document.

# Procedure

## Phase 1 — Absorption

1. Read `deals/[NombreDeal]/00-context/context-document.md`.
2. Read `deals/[NombreDeal]/01-customer-map/customer-map.md`.
3. Read template: `shared/templates/02-offer-design.md`.
4. Read scoring rubric: `shared/references/scoring-rubric.md`.
5. Read knowledge: `shared/knowledge/hormozi_100m_offers.md` (Value Equation, guarantee frameworks, pricing).
6. Verify both prerequisite documents exist. If Customer Map is missing, inform user and suggest running customer-mapping first.

## Phase 2 — Strategy Direction (PAUSE 1)

7. Extract from Customer Map:
   - Transformation Promise (selected variant)
   - Value Equation Diagnosis (where value is highest/lowest)
   - Big Domino and belief architecture
   - Prioritized obstacles
8. Formulate proposed offer strategy direction:
   - Which Value Equation factors to prioritize
   - Proposed offer positioning (New Opportunity vs Opportunity Switch)
   - Proposed scope and boundaries
9. **INTERACTION GATE:** Present strategy direction to user.
   - "Based on the Customer Map, I propose focusing the offer on [priorities]. The positioning is [type]. Here's the reasoning: [2-3 sentences]."
   - "Does this direction align with your vision? Any adjustments?"
   - Wait for confirmation or redirect before continuing.

## Phase 3 — Stack and Deliverables (PAUSE 2)

10. Design the offer stack (3 layers: Foundation -> Intelligence -> Control):
    - Map each obstacle from Customer Map to stack components
    - Ensure each layer increases Likelihood or decreases Effort/Time
    - Tag each component: `grounded` or `proposed`
11. Draft Problem -> Solution table (Section 4) mapping Context problems to offer solutions.
12. **INTERACTION GATE:** Present stack design to user.
    - "Here's the proposed stack with 3 layers. Each layer addresses [obstacles]."
    - "Is the stack complete? Any components missing or unnecessary?"
    - Wait for validation before proceeding.

## Phase 4 — Plan Architecture (PAUSE 3)

13. Design plan tiers:
    - Plan 1 (Foundation): minimum viable infrastructure, not "basic"
    - Plan 2 (Intelligence/Advanced): everything in Plan 1 + advanced capabilities
    - Plan 3 (Premium, optional): if scope warrants a third tier
14. For each plan: what it IS, what it DOES, what it ENABLES, what it does NOT do.
15. Design upgrade path (Escalera): fair, pressure-free, natural progression.
16. **INTERACTION GATE:** Present plan architecture to user.
    - "I've structured [2-3] plans with this differentiation: [summary]."
    - "Does each plan have a clear distinct role? Is the upgrade path fair?"
    - Wait for approval before detailing.

## Phase 5 — Guarantee Design (PAUSE 4)

17. Design guarantee mechanism:
    - What will be tested/validated
    - How validation happens (objective criteria, not subjective "liking")
    - What happens if it fails (refund, remediation, specific consequence)
    - Address the core fear from Context Document
18. Apply conservative bias: must be deliverable, not aspirational.
19. **INTERACTION GATE:** Present guarantee to user.
    - "Proposed guarantee: [mechanism]. Validation criteria: [list]. If it fails: [consequence]."
    - "Does this address the client's core fear? Is it deliverable?"
    - Wait for approval.

## Phase 6 — Full Document Production

20. Produce complete 12-section offer document following template:
    - 00: ONE SENTENCE PITCH (transformation, not features)
    - 0: NOMBRE DEL PROYECTO
    - 1: AVATAR DIA 1 (from Customer Map Block 1)
    - 2: OBSTACULOS PRINCIPALES (from Customer Map Block 3)
    - 3: DREAM OUTCOME — Avatar Dia 90 (from Customer Map Block 2)
    - 4: TABLA RESUMEN Problema -> Solucion
    - 5: STACK INTELIGENTE (from Phase 3 approved design)
    - 6: ARQUITECTURA DE LA OFFER (from Phase 4 approved plans)
    - 7: TOOLKIT PRACTICO (optional)
    - 8: ESCALERA Y UPGRADE
    - 9: GARANTIA (from Phase 5 approved design)
    - 10: VISION A LARGO PLAZO
    - 11: FRASE DE CIERRE (Hormozi-style reframe)
21. Preserve all emoji markers per TEMPLATE-RULES.md.
22. Replace all placeholders with real content — none may remain.
23. Save to `deals/[NombreDeal]/02-offer/offer-design.md`.

## Phase 7 — Self-Critique

24. Read scoring rubric: `shared/references/scoring-rubric.md`.
25. Score the offer against 6 criteria (1-10 each):
    1. Dream Outcome Clarity
    2. Obstacle Coverage
    3. Stack Value
    4. Plan Differentiation
    5. Guarantee Strength
    6. Time/Effort Reduction
26. For each criterion: score, rationale, improvement opportunity.
27. Calculate overall score (sum/60 = percentage).
28. Identify strengths (2-3 bullets) and critical gaps (2-3 bullets).
29. Save to `deals/[NombreDeal]/scratch/offer-self-critique.md`.

## Phase 8 — Final Presentation

30. Present self-critique summary to user:
    - Overall score
    - Strengths and critical gaps
    - Top 2-3 improvement areas
31. Ask user: "Self-critique scores [X/60]. Areas to improve: [list]. Want to refine specific sections, or accept as-is and proceed to template-formatting?"
32. If user wants refinements: apply them, re-score affected criteria, update both documents.
33. If user accepts: confirm offer is ready for proposal formatting.

# Anti-patterns

- Producing the full 12-section document without the 4 interaction gates. The gates prevent wasted work and make the user a co-designer.
- Forcing a v1 -> v2 cycle when v1 is strong. If self-critique scores high and user is satisfied, accept it. No mandatory v2.
- Skipping the Customer Map and designing directly from Context. The Customer Map IS the interpretive foundation — without it, you're guessing at frameworks.
- Generic stack components that don't map to specific obstacles. Every component must solve something.
- Plans that are just "more features" without distinct roles. Each plan should solve a different problem or serve a different ambition level.
- Aspirational guarantees that can't be delivered. Conservative bias always.
- Omitting design choice tags (`grounded`/`proposed`). Traceability is required.
- Skipping self-critique. It is a mandatory output, not optional.
