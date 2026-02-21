# SPECS.md

Requirements and acceptance criteria. Use this file when:
- A requirement is ambiguous or contested
- Multiple people need to agree on what "done" means
- You are delegating implementation to Codex or a sub-agent

Do not create this for every task — only when the above conditions apply.

---

## Format

```
### [Feature or capability name]

**Requirement:** [What must be true when this is done]

**Acceptance criteria:**
- AC1: [Specific, testable condition]
- AC2: [Specific, testable condition]
- AC3: [Specific, testable condition]

**Non-goals:** [What this spec deliberately does not cover]

**Notes:** [Optional: edge cases, references, open questions]
```

---

## Example

### Progress tracking update skill

**Requirement:** The update-progress skill must update docs/PROGRESS.md without requiring Claude to read the entire file first.

**Acceptance criteria:**
- AC1: Given a task name and new status, the skill outputs a minimal diff targeting only the relevant checkbox
- AC2: The skill adds a dated entry to the Change Log section automatically
- AC3: The skill fails loudly (error message) if the task name is not found in the file
- AC4: The skill does not touch any section other than the checkbox and the Change Log

**Non-goals:** This spec does not cover syncing PROGRESS.md to GitHub Issues (that is a separate skill).

**Notes:** The skill reads only the relevant section of the file, not the full contents.

---

[Add new specs above this line]
