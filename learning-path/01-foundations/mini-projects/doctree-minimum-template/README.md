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
# 1. Fill CLAUDE.md Project Snapshot — name, purpose, phase, objective
# 2. Fill docs/CONTEXT.md — only the sections that apply (Goal + Scope always; rest as needed)
# 3. Customize docs/PROGRESS.md — replace checklist with your tasks
# 4. Delete files you won't use (CODEX.md, ANTIGRAVITY.md, SPECS.md, etc.)
# 5. Delete or adapt skills/update-progress/ — add your actual skills
```

## 5-minute setup checklist

- [ ] Copy template to new location
- [ ] Update `README.md` (this file) with project name and purpose
- [ ] Fill `CLAUDE.md` Project Snapshot — name, purpose, ICP, phase, objectives, stack
- [ ] Fill `docs/CONTEXT.md` — only the sections that apply to this project (see table below). Agents will only be as useful as what is written here.
- [ ] Set initial tasks in `docs/PROGRESS.md`
- [ ] Rename or remove `skills/update-progress/` if not needed
- [ ] Confirm `.claude/agents/project-manager.md` is wired correctly
- [ ] First commit: `feat(init): scaffold project from doctree-minimum-template`

## Minimum viable setup

The smallest usable version of this template is three files:

```
CLAUDE.md          ← project snapshot + rules
docs/CONTEXT.md    ← project knowledge (fill only the sections that apply)
docs/PROGRESS.md   ← task state
```

Everything else is optional. The files are included in the template because they're used frequently — but delete or ignore any that don't fit the project.

## Directory overview

| Path | Purpose | When to use |
|---|---|---|
| `CLAUDE.md` | Project snapshot + Claude operating rules | Always |
| `docs/CONTEXT.md` | Master project knowledge (fill only relevant sections) | Always |
| `docs/PROGRESS.md` | Source of truth for task state | Always |
| `CODEX.md` | Codex coordination protocol | Only if using Codex |
| `ANTIGRAVITY.md` | Antigravity/Gemini coordination protocol | Only if using Antigravity |
| `docs/DECISIONS.md` | Decision log with tradeoffs | When decisions have real tradeoffs worth logging |
| `docs/SPECS.md` | Requirements and acceptance criteria | When requirements are unclear or need sign-off |
| `.claude/agents/project-manager.md` | PM sub-agent for state management | When session hygiene is worth automating |
| `outputs/drafts/` | In-progress deliverables | When the project produces file-based outputs |
| `outputs/final/` | Accepted deliverables | When the project produces file-based outputs |
| `skills/` | Reusable cognitive modules | Only when a task recurs across 2+ projects |
| `templates/` | Copy-pasteable doc and prompt templates | Only when the same doc structure repeats |

## docs/CONTEXT.md sections — fill what applies

The sections in CONTEXT.md are also optional. A quick internal tool doesn't need ICP or competitive context. A solo code project doesn't need stakeholders or business model. Fill the sections that are actually relevant to how agents will use them — leave the rest blank or delete them.

| Section | Fill when... |
|---|---|
| Goal | Always |
| Product / Service | Always — even if it's an internal tool |
| Business model | Revenue or cost implications are in scope |
| ICP | Any output is aimed at an external audience |
| Audience segments | There are meaningful sub-segments beyond the ICP |
| Competitive context | Positioning, messaging, or market research is in scope |
| Strategic objectives | You need agents to align output to measurable goals |
| Tech stack | Any code, infra, or tool selection is involved |
| Channels | Acquisition, distribution, or comms are in scope |
| Team / Collaborators | More than one person or tool is contributing |
| Scope / Out of scope | Always — keeps agents from drifting |
| Assumptions / Constraints | Always — surfaces hidden limits early |

## Diagnosis embedded in this template

See `docs/DECISIONS.md` for the Keep/Change/Remove rationale and the operational rules that shaped this structure.
