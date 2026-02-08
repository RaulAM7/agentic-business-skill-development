# Claude Code: Context & Memory Best Practices
*A practical guide to managing context, CLAUDE.md, and long project workflows*

---

## The Core Commands

| Command | What It Does | When to Use |
|---------|-------------|-------------|
| `/context` | Shows what's using your context window (tokens by category) | Check regularly - know where your space is going |
| `/compact` | Compresses conversation history into a summary | At ~70% capacity, or when switching sub-tasks |
| `/clear` | Wipes conversation completely, fresh start | After commits, when switching to unrelated work |
| `/resume` | Reopens your last session with full context | When you restart Claude Code and want to continue |
| `/usage` | Shows token consumption and cost estimates | To monitor daily usage and stay within limits |

---

## Context Window Management

### The Golden Rules

1. **Monitor actively** - Don't wait for auto-compact. Check `/context` regularly.
2. **Compact at 70%** - The sweet spot. Auto-compact triggers at 75-92% but by then quality may already be degrading.
3. **Clear at natural breakpoints** - After a commit, after finishing a feature, before switching from frontend to backend work.
4. **Sessions that stop at 75% produce better code** - Less total output, but higher quality and more maintainable.

### Compact Like a Pro

- Run `/compact` with a focus: `/compact` then tell Claude what to preserve (e.g., "keep the architecture decisions and file paths")
- Add a "Compact Instructions" section to your CLAUDE.md to control what's always preserved
- Since v2.0.64, compacting is instant - no waiting

### Watch for Context Hogs

- **MCP servers** add tool definitions to every request. Run `/mcp` to check per-server costs
- **Large file reads** eat context fast. Use targeted reads (specific lines) instead of reading entire files
- **Long conversations** accumulate. Compact or clear before things get bloated

---

## CLAUDE.md: Your Project Memory

### What Is It?

CLAUDE.md is a markdown file that loads automatically every time you start Claude Code. It's your way of giving Claude persistent memory that survives across sessions - project rules, conventions, and context that would otherwise need to be re-explained every time.

### The WHY / WHAT / HOW Framework

Structure your CLAUDE.md around three questions:

- **WHAT** - Your tech stack, project structure, what each folder/component does
- **WHY** - The project's purpose, business context, key decisions and their rationale
- **HOW** - Build commands, test procedures, deployment steps, verification methods

### The Memory Hierarchy

```
~/.claude/CLAUDE.md          ← Global (applies to ALL projects)
project-root/CLAUDE.md       ← Project-level (loads at launch)
project-root/src/CLAUDE.md   ← Directory-level (loads on demand when Claude reads files here)
```

Files higher in the hierarchy load automatically. Child directory files load only when Claude accesses that directory.

---

## Do's and Don'ts

### DO

- **Keep it under 300 lines** - HumanLayer's root file is under 60 lines. Concise = effective.
- **Be specific** - "Use 2-space indentation" beats "Format code properly"
- **Use Progressive Disclosure** - Don't dump everything in CLAUDE.md. Create separate docs (`docs/architecture.md`, `docs/testing.md`) and reference them with @path/to/file
- **Use file:line references** - Point to code patterns instead of copying snippets that go stale
- **Write it manually** - This is high-leverage. Craft every line intentionally.
- **Only include universally applicable info** - If it doesn't apply to most tasks, it doesn't belong here
- **Use bullet points under descriptive headings** - Structure helps Claude parse and prioritize

### DON'T

- **Don't use it as an instruction dump** - Frontier models handle ~150-200 instructions reliably. Claude's own system prompt already has ~50. Don't overload it.
- **Don't put code style rules here** - Use linters (eslint, Biome, Prettier). Never send an LLM to do a linter's job.
- **Don't auto-generate it** - AI-generated CLAUDE.md files tend to be bloated and unfocused
- **Don't include irrelevant context** - Database schema guidance when working on frontend only dilutes focus
- **Don't rely on it for everything** - Claude may skip parts it deems irrelevant to the current task

---

## Workflows for Long Projects

### The Scratchpad Pattern

Offload planning and progress to markdown files that persist between sessions:

```
project/
├── CLAUDE.md              ← Persistent rules and context
├── scratchpad.md          ← Current task progress, decisions, blockers
├── docs/
│   ├── architecture.md    ← How the system works
│   ├── decisions.md       ← Key decisions and rationale
│   └── session-log.md     ← Session summaries for continuity
```

### The Session Handoff Workflow

1. **Before ending a session:** Ask Claude to write a summary to a session file
2. **Clear or close** the session
3. **Next session:** `/resume` picks up automatically, OR start fresh and point Claude at the session notes

### The Feature Workflow

1. Start fresh (`/clear`)
2. Work on the feature
3. Compact at 70% if the conversation gets long
4. Commit when done
5. Clear before starting the next feature

### The Research → Execute Pattern

1. **Session 1:** Research and plan. Save findings to a file.
2. `/clear`
3. **Session 2:** Execute using the research file as context. Fresh context = better execution.

---

## Recommended CLAUDE.md Starter Template

```markdown
# Project Name

## What This Is
[1-2 sentences about the project]

## Tech Stack
- [Language/framework]
- [Database]
- [Key tools]

## Project Structure
- `src/` - [what's in here]
- `docs/` - [reference docs, architecture decisions]
- `tests/` - [test location and how to run them]

## Key Commands
- Build: `[command]`
- Test: `[command]`
- Deploy: `[command]`

## Conventions
- [Naming conventions]
- [File organization rules]
- [Any non-obvious patterns]

## Important Context
- [Key business rules]
- [Architecture decisions and WHY they were made]
- [Known gotchas]

## Compact Instructions
When compacting, always preserve:
- Current task and progress
- File paths being worked on
- Key decisions made in this session
```

---

## Quick Reference Card

| Situation | Action |
|-----------|--------|
| Starting a new task | `/clear` then state the task |
| Context at 70% | `/compact` with focus instructions |
| Switching from frontend to backend | `/clear` or `/compact` |
| Ending a session | Ask Claude to summarize → save to file |
| Resuming next day | `/resume` or start fresh with session notes |
| Claude seems confused/slow | Check `/context` → probably too full → `/compact` |
| Repeating yourself across sessions | Add it to CLAUDE.md |
| Need Claude to follow a specific format | Save template as file, reference with @ |

---

## Sources

- [Claude Code Docs: Manage Memory](https://code.claude.com/docs/en/memory)
- [HumanLayer: Writing a Good CLAUDE.md](https://www.humanlayer.dev/blog/writing-a-good-claude-md)
- [MCPcat: Managing Claude Code Context](https://mcpcat.io/guides/managing-claude-code-context/)
- [Claude Code Best Practices Guide](https://rosmur.github.io/claudecode-best-practices/)
- [Steve Kinney: Claude Code Compaction](https://stevekinney.com/courses/ai-development/claude-code-compaction)
- [DeepWiki: Context Window Management](https://deepwiki.com/FlorianBruniaux/claude-code-ultimate-guide/3.2-context-window-management)
