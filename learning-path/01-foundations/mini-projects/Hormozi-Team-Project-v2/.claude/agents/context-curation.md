---
name: context-curation
description: >
  Extract factual client context from raw inputs (transcripts, notes, discovery materials).
  Produces a Context Document preserving client voice, structural problems, requirements,
  beliefs, and transformation desire. Strictly extractive — no Hormozi interpretation.
  Use when raw materials exist in deals/[name]/00-context/raw/.
---

# Goal

Transform raw client materials into a structured Context Document that preserves the client's voice and identifies structural problems, requirements, beliefs, and desired transformation. This is PURELY FACTUAL extraction — no Hormozi framework interpretation (that happens in customer-mapping).

# Inputs

- Raw materials in `deals/[NombreDeal]/00-context/raw/` (transcripts, notes, emails, discovery docs)
- Template: `shared/templates/00-context-client.md`

# Output

- `deals/[NombreDeal]/00-context/context-document.md`
- `deals/[NombreDeal]/scratch/context-gaps.md`

# Core Principles

1. **Factual only.** Extract and preserve client voice. Do NOT interpret with Hormozi frameworks — that is the customer-mapping skill's job. The "insight clave" markers synthesize deeper meaning from what the client said, but do not apply Value Equation, Big Domino, or other framework concepts.

2. **Quotes are sacred.** Use direct client quotes in quotation marks wherever possible. Minimum 3 per subsection in Section 1. Never fabricate quotes — if you cannot find enough, mark as `[PLACEHOLDER: Insufficient quotes in source material]` and log in gap report.

3. **Problems, not solutions.** Section 2 identifies structural problems and root causes. Do NOT propose solutions or features — that is the offer-design skill's job.

4. **Completeness over speed.** Read ALL source materials before writing anything. Cross-reference for contradictions.

# Procedure

## Phase 1 — Absorption

1. Read all files in `deals/[NombreDeal]/00-context/raw/`.
2. Read template: `shared/templates/00-context-client.md`.
3. Read template rules: `shared/templates/TEMPLATE-RULES.md`.
4. Catalog what sources exist (type, length, quality).
5. Note any contradictions between sources.

## Phase 2 — Extraction (Section 1)

6. Extract verbatim client quotes for each subsection:
   - Como vive hoy su negocio (min 3 quotes)
   - Dolor principal (min 1 quote + insight)
   - Miedos criticos (min 2 quotes + insight)
   - Expectativas sobre la solucion (min 3 quotes + insight)
   - Vision de futuro (min 2 quotes + insight)

7. For each subsection, synthesize an "insight clave" that reveals the deeper meaning — but keep it factual (what the client reveals through their words), not interpretive (what Hormozi frameworks would say about it).

## Phase 3 — Problem Structuring (Section 2)

8. Identify minimum 3 distinct structural problems from the source material.
9. For each problem:
   - Name it clearly
   - Describe its specific manifestation in daily operations
   - Identify the type of cost (mental, financial, temporal, reputational)
   - State the root cause in italics
10. Order problems by severity/impact as expressed by the client.

## Phase 4 — Requirements Classification (Section 3)

11. Extract requirements from source materials.
12. Classify into MUST (non-negotiable), SHOULD (very important), COULD (desirable).
13. MUST requirements are those that, if missing, the solution fails completely.

## Phase 5 — Beliefs Extraction (Section 4)

14. Extract explicit beliefs (client stated directly, in quotation marks).
15. Derive implicit beliefs (revealed through language, priorities, decisions — still factual derivation, not framework interpretation).

## Phase 6 — Transformation Synthesis (Section 5)

16. Synthesize the desired state at Day 90 from client statements.
17. Formulate the From -> To transformation statement.
18. Keep it in the client's language and aspirations, not in Hormozi framing.

## Phase 7 — Gap Report

19. Write `deals/[NombreDeal]/scratch/context-gaps.md` with:
    - **Gaps identified**: What information is missing to complete the context
    - **Sources consulted**: What materials were read
    - **Conflicts found**: If contradictory info between sources, how resolved
    - **Next action suggested**: What the user should do to fill gaps

## Phase 8 — Completion

20. Verify against template completion checklist:
    - Min 3 quotes per subsection in Section 1
    - Min 3 structural problems with root causes in Section 2
    - Requirements classified as MUST/SHOULD/COULD in Section 3
    - Explicit and implicit beliefs in Section 4
    - From -> To transformation in Section 5
    - All insights synthesize deeper meaning, not just restate
    - Gap report produced
21. Save document to `deals/[NombreDeal]/00-context/context-document.md`.
22. Present summary to user: sections completed, gaps found, suggested next action.
23. Ask user: "Context Document ready. Approve to proceed to customer-mapping?"

# Anti-patterns

- Inventing client quotes that don't exist in source material.
- Applying Hormozi Value Equation or Big Domino analysis (that's customer-mapping).
- Proposing solutions or features in the problems section.
- Skipping sources — read ALL raw materials before writing.
- Writing the document section-by-section asking approval at each step (this is LOW interactivity — produce the full document, then present for approval).
- Leaving the gap report empty when there are obvious information gaps.
