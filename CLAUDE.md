# CLAUDE.md

## Purpose
This repository is a learning-by-building system for developing agentic business skills. It combines structured learning phases with practical agent implementation, prompt engineering, and skill development. The goal is to build competence through iterative execution and experimentation.

## Repository Structure

**Input/Learning:**
- `learning-path/` — Organized learning phases with exercises, problems, and guided implementations

**Reusable Outputs:**
- `agents/` — Agent implementations and orchestration patterns
- `prompts/` — Prompt templates and engineering patterns
- `skills/` — Reusable skill modules and utilities
- `templates/` — Templates for common tasks and structures

**Support:**
- `docs/` — Architecture decisions, concepts, references
- `experiments/` — Temporary work, exploration, and hypothesis testing

## Using Claude Code in This Repository

1. **Read first** — Always read the current file before editing
2. **Execute directly** — Don't ask clarifying questions unless genuinely ambiguous
3. **Preserve structure** — Follow the directory conventions
4. **Keep it lean** — No placeholder files, no fluff, only what's necessary
5. **Track cost** — Be mindful of model usage; prefer batch operations

## Project Management / Learning Path Tracking

**System Overview:**
- `learning-path/PROGRESS.md` — Source of truth for learning progress (checkboxes)
- GitHub Issues — External tracking layer (labels, milestones, issues)
- GitHub Project — Visual board for organizing issues by phase/status
- `docs/github-tracking.md` — Label conventions and sync protocol
- `.claude/agents/itinerary-pm.md` — Sub-agent for PROGRESS.md ↔ GitHub sync

**Setup:**
1. Run `./scripts/bootstrap_github_tracking.sh` once to create labels, milestones, and issues ✓
2. Run `./scripts/one-time-auth-setup.sh` to grant project scopes (browser required)
3. Run `./scripts/setup_github_project.sh` to create the project board
4. See `GITHUB_PROJECT_SETUP_REQUIRED.md` for detailed instructions

**Workflow:**
1. Update checkboxes in PROGRESS.md as you complete learning units
2. Run `/agent itinerary-pm` to sync with GitHub Issues
3. View project board in GitHub for visual progress tracking

**Rules:**
- PROGRESS.md is always authoritative
- GitHub reflects PROGRESS.md, not vice versa (unless explicitly syncing back)
- Empty phases (02-05) have placeholder issues, not full curriculum
- Extract artifacts to agents/prompts/skills as you complete modules

**Do NOT:**
- Invent content structure that doesn't exist
- Mark checkboxes complete without actually doing the work
- Create GitHub issues manually (use bootstrap script or itinerary-pm)

## Context and Memory Principles

- Each phase in `learning-path/` is a self-contained learning unit
- Don't reference work across phases unless explicitly connected
- Use `/clear` frequently to manage context window
- Long tasks should be broken into discrete phases
- Output goes to agents/prompts/skills, input comes from learning-path

## Style Guide

- Markdown only for documentation
- No emojis
- No storytelling or narrative
- Concise, structural, explicit
- Everything survives a `/clear`
