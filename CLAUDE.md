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
