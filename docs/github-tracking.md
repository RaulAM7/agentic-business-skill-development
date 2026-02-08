# GitHub Tracking Conventions

This document defines the tracking system for learning path progress using GitHub Issues, Labels, and Milestones as the external tracking layer, with `learning-path/PROGRESS.md` as the single source of truth.

## Label Conventions

### Phase Labels
Used to organize issues by learning phase:
- `phase:01` - Phase 01: Foundations
- `phase:02` - Phase 02: [TBD]
- `phase:03` - Phase 03: [TBD]
- `phase:04` - Phase 04: [TBD]
- `phase:05` - Phase 05: [TBD]

### Type Labels
Indicate the nature of the issue:
- `type:learning` - Learning unit (module, lesson, exercise)
- `type:exercise` - Hands-on exercise or mini-project
- `type:extraction` - Extract agents, prompts, or skills from learning content
- `type:curriculum` - Curriculum definition and planning
- `type:admin` - Administrative tasks (tracking, synchronization)

### Status Labels
Indicate issue status relative to blocking dependencies:
- `status:ready` - Unblocked, can be started
- `status:in-progress` - Currently being worked on
- `status:blocked` - Cannot start until dependencies are complete

## Milestones

One milestone per phase:
- **Phase 01: Foundations** — Primary learning phase with crash course content
- **Phase 02: [TBD]** — Second learning phase
- **Phase 03: [TBD]** — Third learning phase
- **Phase 04: [TBD]** — Fourth learning phase
- **Phase 05: [TBD]** — Fifth learning phase

Milestones serve as organizational containers. Issues are assigned to their corresponding phase milestone.

## Issue Title Format

All issue titles follow the pattern: `[Phase XX] Category: Specific Item`

Examples:
- `[Phase 01] Learning: Complete Module 2.4 - GitHub Integration`
- `[Phase 01] Exercise: Implement crash-course-antigravity`
- `[Phase 01] Extraction: Extract agents from crash-course`
- `[Phase 02] Curriculum: Define Phase 02 learning objectives`

## Issue Body Template

```markdown
## Description
[Purpose and context]

## Acceptance Criteria
- [ ] Criterion 1
- [ ] Criterion 2

## Links
- PROGRESS.md: [checkbox reference]
- Related issues: [if any]
```

## Definition of Done

### For Learning Units
- Content exists in `learning-path/01-foundations/`
- Module lesson file has substantial content (not placeholder)
- Corresponding checkbox in PROGRESS.md
- Issue can be closed when checkpoint is marked complete

### For Extraction Tasks
- Agent/prompt/skill extracted to `agents/`/`prompts/`/`skills/`
- File follows naming and structure conventions
- Documented with reference back to source material
- Issue closed when artifact added and committed

### For Curriculum Tasks
- Phase objectives and learning outcomes defined
- Lesson plan structured and documented
- Blocked issues created for individual modules
- Issue remains open; sub-issues track implementation

## Sync Protocol

### PROGRESS.md is Authoritative

- Checkboxes in PROGRESS.md represent the real state of completion
- GitHub Issues reflect PROGRESS.md, never the reverse
- Manual changes to PROGRESS.md are the source of truth

### GitHub Issues Reflect Reality

- Issue states (open/closed) align with checkbox states
- An unchecked box = open issue with `status:ready` or `status:blocked`
- A checked box = closed issue with closing comment
- Issues orphaned without PROGRESS.md reference are considered stale

### Sync Workflow

1. **Source changes:** User updates PROGRESS.md checkbox
2. **Detect drift:** Run itinerary-pm agent to compare states
3. **Show diff:** Agent displays proposed changes with evidence
4. **Confirm:** User approves sync actions
5. **Apply:** Agent closes/creates issues, updates PROGRESS.md timestamp

### Bootstrap Process

Run `scripts/bootstrap_github_tracking.sh` to:
- Create all labels (idempotent)
- Create all milestones (idempotent)
- Parse PROGRESS.md unchecked items and create corresponding issues
- Skip existing items (safe to re-run)

The script validates `gh` authentication before proceeding and exits with clear error messages if preconditions fail.

## Example: Adding a Learning Module

1. Create lesson directory in `learning-path/01-foundations/crash-course-claude-code/claude-code-for-everyone/lesson-modules/`
2. Create CLAUDE.md with lesson content
3. Add checkbox to PROGRESS.md under appropriate module
4. Run `scripts/bootstrap_github_tracking.sh` OR
5. Manually run itinerary-pm agent to create corresponding issue
6. Mark checkbox complete when done
7. Agent or manual closing updates GitHub issue

## Example: Blocking Dependencies

If Phase 02 curriculum development blocks all Phase 02 learning:

```markdown
## Phase 02 Learning Issue
Status: blocked

### Blocks
- [Phase 02] Learning: Module 2.1
- [Phase 02] Learning: Module 2.2
- ...

### Blocked By
- [Phase 02] Curriculum: Define Phase 02 objectives
```

Use GitHub's blocking relationship feature to track this.

## Manual GitHub Edits

If issues are manually edited in GitHub:
- Run itinerary-pm agent to detect drift
- Agent will flag divergence with evidence
- User chooses which source is authoritative
- Agent syncs the other system to match

This prevents stale issues and keeps systems aligned.

## Cleanup and Archiving

- Closed issues remain for historical reference
- Use GitHub's archive feature if milestones become completed
- Do not delete issues; mark them with appropriate labels for future reference
- Annual cleanup: review closed issues and archive past phases

## Reference

**Related documentation:**
- `PROGRESS.md` - Single source of truth for learning progress
- `itinerary-pm.md` - Agent that maintains PROGRESS.md ↔ GitHub sync
- `CLAUDE.md` - Project learning system overview
