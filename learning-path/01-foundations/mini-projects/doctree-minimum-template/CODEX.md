# CODEX.md

Coordination protocol for using Codex in parallel with Claude on this project.

## Role

Codex implements. Claude plans and reviews. Do not blur this boundary without explicit intent.

Codex is best used for:
- Writing code from a clearly defined spec or plan
- Refactoring existing code according to stated rules
- Generating boilerplate that follows a demonstrated pattern
- Translating pseudocode or structured outlines into implementation

## What Codex needs as input

Always provide all three:

1. **Context block** — paste the relevant section of `docs/CONTEXT.md` (Goal + Scope + Constraints)
2. **Task block** — paste the specific task from `docs/PROGRESS.md` or `docs/SPECS.md`
3. **Constraints block** — any formatting rules, naming conventions, or acceptance criteria

Minimal input template:
```
CONTEXT:
[paste from docs/CONTEXT.md — Goal, Scope, Constraints]

TASK:
[paste the specific task — be precise about inputs, outputs, and format]

CONSTRAINTS:
[paste relevant rules — naming, style, acceptance criteria]
```

## Rule: do not touch SOT without PROGRESS update

If Codex produces output that changes project state (new files, completed features, revised logic), update `docs/PROGRESS.md` before the session ends. Codex does not update docs — that is Claude's job.

## Recommended pattern

```
Claude → writes plan (docs/SPECS.md or inline)
       → pastes context + task to Codex
Codex  → implements
Claude → reviews output
       → updates docs/PROGRESS.md
       → commits
```

## Parallel use

You can run Codex and Claude simultaneously on independent tasks:
- Claude on docs, PROGRESS, DECISIONS
- Codex on implementation tasks from the task list

Independent means: no shared file being written at the same time. Merge before starting overlapping work.

## Anti-patterns to avoid

- Pasting raw chat history as input to Codex (extract only what's relevant)
- Using Codex to plan or architect (bring the plan to Codex, not vice versa)
- Committing Codex output without Claude review
- Letting Codex update PROGRESS.md, DECISIONS.md, or CONTEXT.md directly
