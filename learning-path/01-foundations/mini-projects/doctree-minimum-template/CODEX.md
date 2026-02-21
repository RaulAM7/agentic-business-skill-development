# CODEX.md

Coordination protocol for using Codex in parallel with Claude on this project.

## Role

Codex implements. Claude plans and reviews. Do not blur this boundary without explicit intent.

Codex is best used for:
- Writing code from a clearly defined spec or plan
- Refactoring existing code according to stated rules
- Generating structured content (templates, outlines, data schemas) from a demonstrated pattern
- Translating pseudocode or structured outlines into working implementation

Codex is not reliable for:
- Architectural decisions or tradeoff analysis (Claude does this)
- Generating ICP-aligned copy or strategy without deep context priming
- Updating PROGRESS.md, DECISIONS.md, or CONTEXT.md (Claude does this)

---

## What Codex needs as input

Codex output quality is directly proportional to context quality. Always provide a context block matched to the task type.

### For code tasks

```
PROJECT:
[Project name] — [one-line purpose from CLAUDE.md Project Snapshot]

PRODUCT:
[What is being built — from CONTEXT.md §2]

TECH STACK:
[Languages, frameworks, infra — from CONTEXT.md §8]

TASK:
[Precise description — inputs, outputs, format, file paths, edge cases]

CONSTRAINTS:
[Naming conventions, style rules, acceptance criteria from SPECS.md if applicable]

DO NOT:
[Anti-patterns or scope exclusions specific to this task]
```

### For content or copy tasks

```
PROJECT:
[Project name] — [one-line purpose]

PRODUCT:
[What it does and what makes it different — from CONTEXT.md §2]

ICP:
[Who the reader is, their pain, their buying trigger — from CONTEXT.md §4]

COMPETITIVE CONTEXT (if relevant):
[What alternatives exist and how we position against them — from CONTEXT.md §6]

OBJECTIVE OF THIS CONTENT:
[What should the reader think, feel, or do after reading this?]

TASK:
[Precise description — format, length, tone, structure, placement]

CONSTRAINTS:
[Brand voice, word count, prohibited phrases, formatting rules]
```

### For data or analysis tasks

```
PROJECT:
[Project name] — [one-line purpose]

BUSINESS MODEL:
[How this project makes or supports revenue — from CONTEXT.md §3]

KEY METRIC BEING ANALYZED:
[The number this task is meant to illuminate — from CONTEXT.md §7]

TASK:
[What to analyze, transform, or produce — with input data format and expected output]

CONSTRAINTS:
[Precision required, output format, statistical methods if specified]
```

---

## Rule: do not touch SOT without PROGRESS update

If Codex produces output that changes project state (new files, completed features, revised logic, published content), update `docs/PROGRESS.md` before the session ends. Codex does not update docs — Claude does.

---

## Recommended workflow

```
Claude → reads CONTEXT.md, identifies task
       → writes plan or spec to docs/SPECS.md or inline
       → pastes correct context block type + task to Codex
Codex  → implements
Claude → reviews against acceptance criteria
       → updates docs/PROGRESS.md
       → commits
```

---

## Parallel use

Run Codex and Claude simultaneously on independent tasks only:
- Claude: docs, PROGRESS, DECISIONS, architecture reviews
- Codex: implementation tasks that have a complete spec

Independent means no shared file is being written at the same time. Merge before starting overlapping work.

---

## Anti-patterns to avoid

- Pasting raw chat history as input (extract only the structured context block)
- Using Codex to plan or architect (bring the plan to Codex, not vice versa)
- Committing Codex output without Claude review
- Sending copy or ICP-facing content tasks to Codex without the ICP block — the output will be generic
- Letting Codex update PROGRESS.md, DECISIONS.md, or CONTEXT.md directly
