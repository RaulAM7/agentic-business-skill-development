---
name: qa-gate
description: >
  Validate any deal document before declaring it complete. Checks acceptance criteria,
  unresolved placeholders, cross-document consistency, and naming conventions.
  ZERO interactivity — pure validation. Produces a pass/fail report with shortest fix path.
  Can be invoked at any stage of the pipeline.
---

# Goal

Validate a deal document against its acceptance criteria, detect unresolved placeholders or Unknown markers, verify cross-document consistency, and check naming/location conventions. Produce a binary pass/fail verdict with specific findings and the shortest path to fix any failures.

# Inputs

- The document to validate (any deal document)
- Its corresponding template (from `shared/templates/`)
- Template rules: `shared/templates/TEMPLATE-RULES.md`
- Upstream documents (for cross-document consistency checks)

# Output

- `deals/[NombreDeal]/scratch/qa-[document-type]-[YYYY-MM-DD].md`

# Core Principles

1. **Binary verdict.** The output is PASS or FAIL. No "mostly good." If any critical check fails, the document fails QA.

2. **Evidence-based.** Every finding cites the exact line, section, or marker that triggered it. No vague "some sections seem incomplete."

3. **Shortest fix path.** For each failure, state the minimum action to resolve it. Do not suggest rewrites or improvements — that's the skill's or user's job. Just identify what's wrong and where.

# Procedure

## Phase 1 — Identify Document Type

1. Determine which document is being validated:
   - Context Document -> template `00-context-client.md`
   - Customer Map -> template `01-customer-map.md`
   - Offer Design -> template `02-offer-design.md`
   - Proposal -> template `03-proposal.md`
   - Proposal Critique -> template `04-proposal-critique.md`

2. Read the document to validate.
3. Read the corresponding template.
4. Read `shared/templates/TEMPLATE-RULES.md`.
5. If cross-document checks are needed, read upstream documents.

## Phase 2 — Template Compliance

6. Verify all required sections from the template are present.
7. Verify section numbering follows TEMPLATE-RULES.md conventions.
8. Verify emoji markers are preserved where required.
9. Verify tables use correct Markdown pipe syntax.

## Phase 3 — Placeholder Detection

10. Scan for unresolved `[PLACEHOLDER: ...]` markers.
11. Scan for `Unknown`, `TBD`, `TODO`, `MISSING`, `N/A` markers that indicate incomplete content.
12. Scan for empty sections (header present but no content).

## Phase 4 — Document-Specific Acceptance Criteria

### If Context Document:
13. Min 3 direct client quotes per subsection in Section 1.
14. Min 3 distinct structural problems with root causes in Section 2.
15. Requirements classified as MUST/SHOULD/COULD in Section 3.
16. Explicit and implicit beliefs in Section 4.
17. From -> To transformation in Section 5.
18. Gap report exists at `deals/[NombreDeal]/scratch/context-gaps.md`.

### If Customer Map:
13. All 6 blocks present and complete.
14. All claims have confidence tags (stated/inferred/hypothesis).
15. Transformation Promise has a selected variant (not all 3 as "options").
16. All interaction gates were addressed (look for validation markers or assume approved if document is complete).

### If Offer Design:
13. All 12 sections present (Section 7 optional but noted).
14. Self-critique exists at `deals/[NombreDeal]/scratch/offer-self-critique.md`.
15. Design choice tags present (grounded/proposed).
16. All plans clearly differentiated.
17. Guarantee has objective validation criteria.

### If Proposal:
13. All 9 sections present (Section 6 optional but noted).
14. No internal metadata in client-facing content (no source comments, no confidence tags).
15. Pricing is complete (no MISSING values).
16. Guarantee passes stress test criteria (objective, performable, deliverable).
17. Contact information is complete.

### If Proposal Critique:
13. All 6 sections present (A through F).
14. Scorecard has all 10 criteria scored with evidence.
15. Bottleneck checklist has all 9 checks with verdicts.
16. Improvement playbook has fixes ordered by leverage.
17. Rewrites provide actual replacement text.
18. Translation check compares offer to proposal.

## Phase 5 — Cross-Document Consistency

19. If validating Offer: check that obstacles match Context problems, that Customer Map insights are reflected.
20. If validating Proposal: check that plans match Offer plans exactly, that pricing aligns, that guarantee language is consistent.
21. If validating Critique: check that scores reference actual proposal content.

## Phase 6 — Naming and Location

22. Verify file is in the correct deal folder and subfolder.
23. Verify file naming follows TEMPLATE-RULES.md conventions.

## Phase 7 — Verdict

24. Compile all findings into a report:
    - **PASS items**: checks that passed (brief list)
    - **FAIL items**: checks that failed (detailed, with line/section references and shortest fix path)
    - **WARNINGS**: non-critical issues worth noting
25. Issue verdict: PASS (all critical checks pass) or FAIL (any critical check fails).
26. Save to `deals/[NombreDeal]/scratch/qa-[document-type]-[YYYY-MM-DD].md`.
27. Present summary to user: "QA [PASS/FAIL]. [X] checks passed, [Y] failed. Top issues: [list]."

# Anti-patterns

- Suggesting improvements or rewrites. QA detects problems, it does not fix them.
- Passing a document with unresolved placeholders. Placeholders are always a FAIL.
- Skipping cross-document consistency. Silent inconsistencies (offer says X, proposal says Y) are the most dangerous.
- Running QA without reading the template. The template defines what "complete" means.
- Issuing PASS when there are critical failures just because the document is "mostly done."
