# PLAN_TO_IMPLEMENT

Prompt template for handing a plan to Claude (for review/revision) or Codex (for implementation).

Copy this template, fill the bracketed sections, and paste to the target tool.

---

## Template

```
ROLE: [implementer / reviewer / architect — pick one based on what you need]

CONTEXT:
[Paste the relevant section of docs/CONTEXT.md — Goal, Scope, Constraints at minimum]

PLAN:
[Paste the specific plan, spec, or set of steps to execute]

CONSTRAINTS:
- [Naming convention, style, or format rule 1]
- [Constraint 2]
- Output goes to: [path — e.g., outputs/drafts/filename.md]

ACCEPTANCE CRITERIA:
- [ ] [Testable condition 1]
- [ ] [Testable condition 2]

DO NOT:
- [Anti-pattern or scope exclusion 1]
- [Anti-pattern or scope exclusion 2]

OUTPUT FORMAT:
[How you want the response structured — e.g., markdown, numbered list, code block]
```

---

## Usage notes

- For Codex: use ROLE: implementer, fill PLAN with the spec from SPECS.md or an inline description
- For Claude review: use ROLE: reviewer, fill PLAN with the draft output, and ask it to check against ACCEPTANCE CRITERIA
- For Antigravity research: strip PLAN and replace with a RESEARCH QUESTION block (see ANTIGRAVITY.md for format)
- Keep DO NOT explicit — it prevents tool drift into adjacent scope
- Acceptance criteria copied from SPECS.md maintain traceability

## Anti-patterns

- Pasting raw chat history as the CONTEXT block (extract only the relevant facts)
- Leaving ACCEPTANCE CRITERIA empty (makes review subjective)
- Using "be creative" in the CONSTRAINTS block (gives no boundary to the tool)
