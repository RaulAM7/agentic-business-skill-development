---
name: template-formatting
description: >
  Transform an approved Offer Design into a formal business proposal. Mechanical
  formatting — faithful translation of offer content into proposal template structure.
  LOW-MEDIUM interactivity — 2 mandatory gates only (methodology at 4.3, guarantee +
  pricing at 8.1). Batch drafts sections between gates. Use after offer-design is complete.
---

# Goal

Translate the approved Offer Design Document into a formal, professional business proposal. This is FORMATTING work, not creative work — the strategic decisions were made in offer-design. The skill's job is faithful translation into the proposal template structure while maintaining professional tone, source traceability, and clear methodology/pricing presentation.

# Inputs

- Context Document: `deals/[NombreDeal]/00-context/context-document.md`
- Customer Map: `deals/[NombreDeal]/01-customer-map/customer-map.md`
- Offer Design: `deals/[NombreDeal]/02-offer/offer-design.md`
- Template: `shared/templates/03-proposal.md`
- Validation gates: `shared/references/validation-gates.md`

# Output

- `deals/[NombreDeal]/03-proposal/proposal.md`

# Core Principles

1. **Faithful translation.** The proposal formalizes the offer — it does NOT redesign it. If the offer says Plan 1 includes X, the proposal says Plan 1 includes X. Creative decisions were already made.

2. **Two gates, not nine.** Only 2 mandatory user validation points: after methodology (4.3) and at guarantee + pricing (8.1). Everything else is batch-drafted. This reduces friction while keeping gates where they genuinely matter.

3. **No internal metadata in output.** The final proposal is a client-facing document. No source citations, no confidence tags, no internal comments in the delivered version. Strip all `<!-- SOURCE: ... -->` and `[stated/inferred/hypothesis]` markers from the final output.

4. **Professional tone.** Business consultant language — credible, strategic, client-centric. Not marketing hype, not technical jargon.

# Procedure

## Phase 1 — Absorption

1. Read `deals/[NombreDeal]/00-context/context-document.md`.
2. Read `deals/[NombreDeal]/02-offer/offer-design.md`.
3. Read template: `shared/templates/03-proposal.md`.
4. Read gates: `shared/references/validation-gates.md`.
5. Optionally read Customer Map for additional context.
6. Verify Offer Design exists and is approved. If missing, inform user and suggest running offer-design first.

## Phase 2 — Batch 1: Sections 1 through 4.3

7. Draft Section 1 — Objeto de la propuesta:
   - From Offer Section 00 (ONE SENTENCE PITCH) + Section 0 (NOMBRE)
   - State what will be built, clarify what it's NOT, list core capabilities
8. Draft Section 2 — Contexto y necesidad detectada:
   - From Context Sections 1-2
   - Current state, structural problem, consequences, strategic reframe
9. Draft Section 3 — Objetivos estrategicos:
   - From Offer Section 3 (DREAM OUTCOME) + Context Section 5
   - 3 levels: immediate control, risk reduction, competitive advantage
10. Draft Sections 4.1-4.3 — Enfoque metodologico (partial):
    - 4.1: Core principle (from Offer stack philosophy)
    - 4.2: Control mechanism (from Offer "Que NO hace" sections)
    - 4.3: Implementation approach (phased/progressive)

11. **MANDATORY GATE 1: Methodology Validation.**
    Present Sections 1-4.3 to user. Ask:
    - "Does the core principle (4.1) reflect client control requirements?"
    - "Is the control mechanism (4.2) sufficient to address client fears?"
    - "Does the phased approach (4.3) reduce deployment risk appropriately?"
    - "Approved? (Y/N)"
    If N: revise based on feedback and re-ask.
    If Y: proceed to Batch 2.

## Phase 3 — Batch 2: Sections 4.4 through 8.0

12. Complete Section 4:
    - 4.4: Governance and traceability
    - 4.5: Validation mechanism (stress test)
13. Draft Section 5 — Diseno del proyecto:
    - From Offer Section 6 (ARQUITECTURA)
    - Plan details, boundaries, upgrade path
    - Match Offer plans exactly
14. Draft Section 6 — (optional motivation/market context):
    - Include if Offer Section 10 (VISION) warrants it
    - Skip if not needed
15. Draft Section 7 — Resultados esperados:
    - From Offer Section 3 (DREAM OUTCOME) per plan
    - Plan comparison table
16. Draft Section 8.1 — Condiciones (Presupuesto):
    - Pricing tables per plan
    - Usage/maintenance costs
    - Plan comparison table
    - Escalera y ampliacion (upgrade path)
    - Guarantee section (from Offer Section 9)

17. **MANDATORY GATE 2: Guarantee + Pricing Validation.**
    Present guarantee and pricing to user. Ask:
    - "Is the guarantee validation criterion objective (not subjective)?"
    - "Can validation be performed before go-live?"
    - "Is the guarantee deliverable?"
    - "Does it address the core fear from Context?"
    - "Are pricing figures finalized and approved?"
    - "Is the upgrade path fair?"
    - "Approved? (Y/N)"
    If N: revise based on feedback and re-ask.
    If Y: proceed to Batch 3.

## Phase 4 — Batch 3: Sections 8.2 through 9

18. Complete remaining conditions (timelines, payment terms, etc.).
19. Draft Section 9 — Contacto:
    - Ask user for contact information if not available
20. Present complete proposal to user for final review.

## Phase 5 — Cleanup and Save

21. Strip all internal metadata from the final document:
    - Remove `<!-- SOURCE: ... -->` comments
    - Remove confidence tags
    - Remove any internal notes
22. Verify no placeholders remain.
23. Verify pricing is complete (no MISSING values).
24. Save to `deals/[NombreDeal]/03-proposal/proposal.md`.
25. Confirm: "Proposal saved. Ready for proposal-critique or delivery."

# Anti-patterns

- Section-by-section approval (9 checkpoints). Only 2 gates matter — use them.
- Redesigning the offer during proposal formatting. If something seems wrong in the offer, flag it to the user rather than silently changing it.
- Leaving internal metadata (source comments, confidence tags) in the client-facing document.
- Inventing methodology or deliverables not in the Offer Design. The proposal formalizes, it does not create.
- Skipping mandatory gates. Gates 1 and 2 are non-negotiable.
- Including pricing without user approval. Pricing is always a user decision.
- Weak guarantees that don't pass the stress test criteria in validation-gates.md.
