# update-progress

Update the task state and change log in `docs/PROGRESS.md` after a work session.

## Purpose

Keeps docs/PROGRESS.md current without requiring Claude to read and rewrite the entire file. Targeted updates to specific checkboxes and the Change Log section only.

Invoke this skill at the end of any session where at least one task changed state or a notable event occurred.

## Inputs

| Input | Type | Description |
|---|---|---|
| `task_name` | string | Exact text of the task as it appears in the checklist (or close enough to match) |
| `new_status` | enum | `done` or `in-progress` |
| `change_summary` | string | One-line description of what happened (for the Change Log) |
| `next_actions` | list | Optional: 1-3 items for the Next Actions section |
| `open_questions` | list | Optional: new questions to add to Open Questions |

## Outputs

A diff-ready block for each section of PROGRESS.md that needs updating:

```
CHECKBOX UPDATE:
- [ ] [task name]  →  - [x] [task name]

CHANGE LOG ENTRY:
| [YYYY-MM-DD] | [change_summary] |

NEXT ACTIONS (replace section if provided):
1. [next action 1]
2. [next action 2]
```

The caller pastes these blocks or approves them for Claude to apply. This skill does not write to the file directly.

## Steps

1. Locate the task in the PROGRESS.md checklist by matching `task_name`
2. Generate the checkbox diff (`[ ]` → `[x]` for done, or confirm as `[ ]` for in-progress)
3. Generate a dated Change Log entry using today's date and `change_summary`
4. If `next_actions` provided, generate a replacement Next Actions block
5. If `open_questions` provided, generate append blocks for the Open Questions section
6. Output all blocks in the format above

## Definition of Done

A skill run is complete when:
- [ ] The checkbox for `task_name` is updated to the correct state
- [ ] A new dated row is added to the Change Log section
- [ ] The output contains no references to tasks not in the current checklist
- [ ] Next Actions and Open Questions are updated only if new input was provided
- [ ] The output does not modify any section other than those listed above

## Example

**Input:**
```
task_name: "Define initial task list in this file"
new_status: done
change_summary: Defined initial 3-phase task list based on project brief
next_actions:
  - Fill docs/CONTEXT.md with actual goal and scope
  - Confirm agent is wired correctly
```

**Output:**
```
CHECKBOX UPDATE:
- [ ] Define initial task list in this file  →  - [x] Define initial task list in this file

CHANGE LOG ENTRY:
| 2026-02-21 | Defined initial 3-phase task list based on project brief |

NEXT ACTIONS (replace section):
1. Fill docs/CONTEXT.md with actual goal and scope
2. Confirm agent is wired correctly
```
