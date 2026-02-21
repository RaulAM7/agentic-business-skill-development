# DECISIONS.md

Decision log. Record decisions with tradeoffs, not just conclusions.

Rule: if a decision took more than 60 seconds to make, log it here.

---

## Format

```
### [YYYY-MM-DD] — [Decision title]

Decision: [What was decided — one sentence]
Why: [The reason — what problem it solves or what goal it serves]
Tradeoff: [What you gave up or what risk you accepted]
Alternatives considered: [Optional — what you ruled out and why]
```

---

## Log

### 2026-02-21 — Template structure based on cognitive load analysis

Decision: Use docs/PROGRESS.md as the single SOT for task state, with CONTEXT/DECISIONS/SPECS as stable companion files.

Why: Splitting docs by update frequency (PROGRESS changes every session, others rarely) reduces the mental overhead of "where does this go?" and makes PROGRESS the reliable entry point.

Tradeoff: Forces discipline — every session must end with a PROGRESS update. There is no fallback file where forgotten updates accumulate.

Alternatives considered: Single NOTES.md for everything (rejected: becomes unstructured over time); GitHub Issues as primary SOT (rejected: too heavy for solo/small projects, requires network).

---

### 2026-02-21 — Multi-tool coordination via explicit protocol files

Decision: Add CLAUDE.md, CODEX.md, and ANTIGRAVITY.md at project root as separate coordination files per tool.

Why: Without explicit protocol, tool roles blur — Claude starts implementing, Codex starts planning, Antigravity output ends up in SOT files without synthesis. Separate files make the contract visible and copy-pasteable.

Tradeoff: Three extra files at the root. Small cognitive overhead upfront, significant reduction in coordination friction over the life of the project.

Alternatives considered: Single TOOLS.md with sections per tool (rejected: less discoverable, harder to paste to each tool separately).

---

### 2026-02-21 — GitHub tracking is opt-in

Decision: GitHub Issues, labels, milestones, and project boards are not part of the core template.

Why: For projects under 3 contributors and 4 weeks, GitHub tracking adds setup overhead that exceeds the value. PROGRESS.md covers the same ground with zero tooling.

Tradeoff: No external visibility or PR-linked progress tracking by default. Teams that need it must set it up deliberately.

Alternatives considered: Include by default (rejected: overkill for most use cases; the bootstrap scripts exist in the parent repo if needed).

---

[Add new entries above this line, most recent first]
