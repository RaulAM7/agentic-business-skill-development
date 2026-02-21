# CLAUDE.md

Project memory for Claude Code. Read the Project Snapshot below before every session. Read docs/CONTEXT.md before generating any deliverable for a specific audience, writing copy, or making architectural decisions.

---

## Project snapshot (fill this when copying the template)

This block is the condensed version of docs/CONTEXT.md. Keep it current. Agents read this first.

**Project name:** [name]
**Purpose:** [one sentence — what it does and for whom]

**Product / service:**
[One sentence: what is being built or sold, and what form it takes]

**ICP:**
[One sentence: who the buyer is, what pain they have, and what triggers them to act]
> Example: Head of Sales at 20-200 person B2B SaaS companies who lose deals because proposals are too slow and generic, triggered after a lost deal or new VP hire.

**Current phase:** [Discovery / Build / Launch / Growth / Optimize]

**Primary objective this sprint:**
[The one thing that matters most right now — measurable if possible]
> Example: Ship v1 of proposal pipeline and validate with 3 internal users by March 1.

**Tech stack:**
[languages, frameworks, infra, AI models — one line or short bullet list]

**Key stakeholders:**
- [Name] — [role] — [what they own or approve]
- [Name] — [role] — [what they own or approve]

**Tools in use:**
- Claude: plans, reviews, updates docs, generates deliverables
- Codex: implements code and structured content from specs
- Antigravity: researches market, ICP, competitors, prior art
- Sub-agents: [list active sub-agents or "none"]

**Full context:** → docs/CONTEXT.md

---

## When to read docs/CONTEXT.md in full

Always read docs/CONTEXT.md before:
- Generating any output intended for the ICP (copy, proposals, emails, landing pages)
- Making decisions about product scope or architecture
- Writing specs or acceptance criteria that involve business logic
- Briefing Codex or Antigravity on a complex task

The Project Snapshot above is sufficient for session orientation and progress tracking. Full CONTEXT.md is necessary when the work requires ICP alignment, competitive awareness, or product-specific judgment.

---

## Source of truth hierarchy

| File | Purpose | Update frequency |
|---|---|---|
| `docs/PROGRESS.md` | Task state, next actions, open questions, change log | Every session |
| `docs/CONTEXT.md` | Full project knowledge: product, ICP, stack, objectives | When scope changes |
| `docs/DECISIONS.md` | Decision log with tradeoffs | When a meaningful decision is made |
| `docs/SPECS.md` | Requirements and acceptance criteria | When a task needs formal spec |

PROGRESS.md is the only file updated every session. All others change rarely.

---

## Operating principles

1. Read the relevant file before editing it
2. Update `docs/PROGRESS.md` at the end of every work session
3. Decisions with tradeoffs → `docs/DECISIONS.md` (date + why + tradeoff)
4. Missing or unclear requirements → `docs/SPECS.md` before generating output
5. Drafts → `outputs/drafts/`; accepted deliverables → `outputs/final/`
6. Sub-agents in `.claude/agents/` for repeated cognitive tasks only
7. Never create a file when editing an existing one achieves the goal
8. When writing for the ICP, re-read their pain and buying trigger in CONTEXT.md §4 first

---

## Delegation protocol

- **Claude:** plans, reviews, judges quality, updates SOT docs, generates ICP-aligned content
- **Codex:** implements (receives plan + context block as input, returns code or structured text)
- **Antigravity:** researches (receives primed question with product + ICP context, returns findings)
- **Sub-agents:** handle scoped, repeated cognitive tasks Claude invokes them for

When handing off to Codex or Antigravity: paste the Project Snapshot + specific task. Never hand off without context. For audience-facing tasks, also include ICP section from CONTEXT.md.

---

## Commit convention

```
feat(scope): short description
fix(scope): short description
docs(scope): short description
refactor(scope): short description
```

One sentence, imperative, no period.

---

## Guardrails

- Do not create GitHub tracking infrastructure unless the project exceeds 3 contributors or 4 weeks
- Do not build a skill until it is needed by at least two distinct tasks
- Do not add templates until you have produced the same doc structure twice manually
- If setup overhead exceeds project complexity, reduce to CLAUDE.md + PROGRESS.md only
- No placeholder files, no lorem ipsum, no documentation for documentation's sake
- Never generate ICP-facing content without first reading docs/CONTEXT.md §4 (ICP) and §6 (Competitive context)
