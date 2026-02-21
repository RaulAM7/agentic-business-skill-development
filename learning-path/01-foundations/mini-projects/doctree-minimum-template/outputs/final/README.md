# outputs/final/

Accepted deliverables. Files here have passed review and are considered done.

## What goes here

- Deliverables that have been reviewed and meet the acceptance criteria in SPECS.md
- Final versions of documents shared externally or used as canonical reference
- Outputs that close a task in docs/PROGRESS.md

## Naming convention

```
[descriptor].md
```

No version suffix, no date prefix. A file in final/ is the current accepted version. If a major revision is needed, move the old version to an `archive/` subdirectory and put the new version in final/.

Examples:
- `proposal-yanira.md`
- `context-synthesis.md`
- `offer-design-v2.md` (only include version if the version distinction is meaningful to stakeholders)

## Acceptance gate

Before moving a draft to final/:

- [ ] Reviewed against acceptance criteria in SPECS.md (or confirmed as meeting the stated goal)
- [ ] Corresponding task in PROGRESS.md is marked complete
- [ ] Draft version in outputs/drafts/ is deleted (or explicitly archived)

## Rules

- Files in final/ are the canonical reference for their subject
- Do not edit final/ files without updating PROGRESS.md and DECISIONS.md
- If a final/ file is superseded, move it to `final/archive/` — do not delete it
