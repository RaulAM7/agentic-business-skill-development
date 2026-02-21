# CLAUDE.md

Project memory for Claude Code. Read this before every session.

## Project identity

Replace this line with: project name, one-sentence purpose, and current phase.

## Source of truth

- `docs/PROGRESS.md` — task state, open questions, change log
- `docs/CONTEXT.md` — goal, scope, assumptions (stable, rarely changes)
- `docs/DECISIONS.md` — logged decisions with tradeoffs
- `docs/SPECS.md` — requirements and acceptance criteria

PROGRESS.md is the only file updated every session. All others change rarely.

## Operating principles

1. Read the relevant file before editing it
2. Update `docs/PROGRESS.md` at the end of every work session
3. Decisions with tradeoffs → `docs/DECISIONS.md` (date + why + tradeoff)
4. Missing or unclear requirements → `docs/SPECS.md` before generating output
5. Drafts → `outputs/drafts/`; accepted deliverables → `outputs/final/`
6. Sub-agents in `.claude/agents/` for repeated cognitive tasks only
7. Never create a file when editing an existing one achieves the goal

## Delegation protocol

- Claude: plans, reviews, judges, updates SOT docs
- Codex: implements (receives plan section as input, returns code/text)
- Antigravity: researches (receives question, returns findings for Claude to synthesize)
- Sub-agents: handle scoped cognitive tasks Claude invokes them for

When handing off to Codex or Antigravity, paste the relevant section of CONTEXT.md + the specific task. Never hand off without context.

## Commit convention

```
feat(scope): short description
fix(scope): short description
docs(scope): short description
refactor(scope): short description
```

One sentence, imperative. No period at the end.

## Guardrails

- Do not create GitHub tracking infrastructure unless the project exceeds 3 contributors or 4 weeks
- Do not build a skill until it is needed by at least two distinct tasks
- Do not add templates until you have produced the same doc structure twice manually
- If setup overhead exceeds project complexity, reduce to CLAUDE.md + PROGRESS.md only
- No placeholder files, no lorem ipsum, no documentation for documentation's sake
