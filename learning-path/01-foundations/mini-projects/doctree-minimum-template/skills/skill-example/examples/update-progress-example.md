# update-progress — worked example

This file shows one complete invocation of the `update-progress` skill from start to finish.

## Scenario

You just finished a session where you:
- Completed the task "Fill docs/CONTEXT.md"
- Started (but did not finish) "Confirm .claude/agents/project-manager.md is correct"
- Realized you need to decide on the output naming convention

## Input provided to the skill

```
task_name: "Fill docs/CONTEXT.md"
new_status: done
change_summary: Filled CONTEXT.md with project goal, scope, and constraints for v1 proposal pipeline
next_actions:
  - Confirm .claude/agents/project-manager.md is correct
  - Decide output naming convention (DECISIONS.md candidate)
open_questions:
  - Should outputs/final/ use date-prefixed filenames or version-prefixed? (affects downstream tooling)
```

## Output from the skill

```
CHECKBOX UPDATE:
- [ ] Fill docs/CONTEXT.md  →  - [x] Fill docs/CONTEXT.md

CHANGE LOG ENTRY:
| 2026-02-21 | Filled CONTEXT.md with project goal, scope, and constraints for v1 proposal pipeline |

NEXT ACTIONS (replace section):
1. Confirm .claude/agents/project-manager.md is correct
2. Decide output naming convention (DECISIONS.md candidate)

OPEN QUESTIONS (append):
- Should outputs/final/ use date-prefixed or version-prefixed filenames? (affects downstream tooling)
```

## What happens next

1. You paste the CHECKBOX UPDATE into PROGRESS.md (or approve Claude to apply it)
2. You paste the CHANGE LOG ENTRY into the Change Log table
3. You replace the Next Actions section with the new list
4. You append the Open Question to the Open Questions section
5. If the output naming question gets resolved, you log the decision in DECISIONS.md
