# doctree-minimum-template

A minimal, copy-pasteable project scaffold for agentic business projects using Claude, Codex, and Antigravity. Designed for single-developer or small-team work with sub-agents and reusable skills.

## What this is

A reference template for starting any agentic project from zero. It enforces a clear source of truth (PROGRESS.md), separates concerns across docs, and provides explicit coordination protocols for multi-tool workflows.

## How to copy it to a new project

```bash
# From the repo root
cp -r learning-path/01-foundations/mini-projects/doctree-minimum-template/ /path/to/new-project/
cd /path/to/new-project/

# Then:
# 1. Fill CLAUDE.md Project Snapshot — name, ICP, phase, objective, stack
# 2. Fill docs/CONTEXT.md — all REQUIRED sections (product, ICP, business model, stack, objectives)
# 3. Customize docs/PROGRESS.md — replace checklist with your tasks
# 4. Delete or adapt skills/update-progress/ — add your actual skills
# 5. Clear docs/DECISIONS.md and docs/SPECS.md (keep structure, delete examples)
```

## 5-minute setup checklist

- [ ] Copy template to new location
- [ ] Update `README.md` (this file) with project name and purpose
- [ ] Fill `CLAUDE.md` Project Snapshot — name, purpose, ICP, phase, objectives, stack
- [ ] Fill `docs/CONTEXT.md` fully — all REQUIRED sections (product, ICP, business model, tech stack, objectives, scope). Agents will only be as useful as what is written here.
- [ ] Set initial tasks in `docs/PROGRESS.md`
- [ ] Rename or remove `skills/update-progress/` if not needed
- [ ] Confirm `.claude/agents/project-manager.md` is wired correctly
- [ ] First commit: `feat(init): scaffold project from doctree-minimum-template`

## Directory overview

| Path | Purpose | Required |
|---|---|---|
| `CLAUDE.md` | Claude Code project memory and rules | Core |
| `CODEX.md` | Codex coordination protocol | Core |
| `ANTIGRAVITY.md` | Antigravity/Gemini coordination protocol | Core |
| `docs/CONTEXT.md` | Master project knowledge: product, ICP, business model, stack, objectives, competitive context | Core |
| `docs/PROGRESS.md` | Source of truth for task state | Core |
| `docs/DECISIONS.md` | Decision log with tradeoffs | Core |
| `docs/SPECS.md` | Requirements and acceptance criteria | Core |
| `.claude/agents/project-manager.md` | PM sub-agent for PROGRESS/DECISIONS management | Core |
| `outputs/drafts/` | In-progress deliverables | Core |
| `outputs/final/` | Accepted deliverables | Core |
| `skills/` | Reusable skill modules | Opt-in |
| `templates/` | Copy-pasteable doc and prompt templates | Opt-in |

## Core vs opt-in

**Core (keep always):** CLAUDE.md, docs/, outputs/, .claude/agents/

**Opt-in (drop if not needed):**
- `skills/` — add only when you have truly reusable cognitive modules
- `templates/` — add only if the project produces standardized documents repeatedly
- GitHub tracking — see root `docs/github-tracking.md` for setup instructions

## Diagnosis embedded in this template

See `docs/DECISIONS.md` for the Keep/Change/Remove rationale and the operational rules that shaped this structure.
