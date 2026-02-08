#!/bin/bash

# GitHub Tracking Bootstrap Script
#
# Creates GitHub infrastructure (labels, milestones, issues) based on PROGRESS.md
# Idempotent: Safe to run multiple times. Skips existing items, creates missing ones.
#
# Usage: ./scripts/bootstrap_github_tracking.sh
#
# Prerequisites:
# - GitHub CLI (gh) installed and authenticated
# - Repository initialized with git
# - PROGRESS.md exists in learning-path/

set -euo pipefail

# ============================================================================
# Configuration
# ============================================================================

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROGRESS_FILE="${REPO_ROOT}/learning-path/PROGRESS.md"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# ============================================================================
# Helper Functions
# ============================================================================

log_success() {
    echo -e "${GREEN}✓${NC} $1"
}

log_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}⚠${NC} $1"
}

log_error() {
    echo -e "${RED}✗${NC} $1"
}

check_prerequisites() {
    log_info "Checking prerequisites..."

    # Check gh CLI
    if ! command -v gh &> /dev/null; then
        log_error "GitHub CLI (gh) not found. Install from https://cli.github.com"
        exit 1
    fi
    log_success "GitHub CLI installed"

    # Check gh auth
    if ! gh auth status &> /dev/null; then
        log_error "Not authenticated with GitHub. Run: gh auth login"
        exit 1
    fi
    log_success "GitHub authenticated"

    # Check PROGRESS.md exists
    if [ ! -f "$PROGRESS_FILE" ]; then
        log_error "PROGRESS.md not found at $PROGRESS_FILE"
        exit 1
    fi
    log_success "PROGRESS.md found"

    # Check git repo
    if ! git -C "$REPO_ROOT" rev-parse --git-dir > /dev/null 2>&1; then
        log_error "Not in a git repository"
        exit 1
    fi
    log_success "Git repository detected"
}

# ============================================================================
# Create Labels
# ============================================================================

create_labels() {
    log_info "Setting up labels..."

    # Phase labels
    declare -a phase_labels=(
        "phase:01:Phase 01 - Foundations"
        "phase:02:Phase 02 - [Curriculum Pending]"
        "phase:03:Phase 03 - [Curriculum Pending]"
        "phase:04:Phase 04 - [Curriculum Pending]"
        "phase:05:Phase 05 - [Curriculum Pending]"
    )

    for label_spec in "${phase_labels[@]}"; do
        IFS=':' read -r label desc <<< "$label_spec"
        if gh label list | grep -q "^${label}$"; then
            log_warn "Label '$label' already exists"
        else
            gh label create "$label" --description "$desc" --color "0366d6"
            log_success "Created label '$label'"
        fi
    done

    # Type labels
    declare -a type_labels=(
        "type:learning:Learning unit (module, lesson, exercise)"
        "type:exercise:Hands-on exercise or mini-project"
        "type:extraction:Extract agents, prompts, or skills"
        "type:curriculum:Curriculum definition and planning"
        "type:admin:Administrative and synchronization tasks"
    )

    for label_spec in "${type_labels[@]}"; do
        IFS=':' read -r label desc <<< "$label_spec"
        if gh label list | grep -q "^${label}$"; then
            log_warn "Label '$label' already exists"
        else
            gh label create "$label" --description "$desc" --color "a2eeef"
            log_success "Created label '$label'"
        fi
    done

    # Status labels
    declare -a status_labels=(
        "status:ready:Unblocked, can be started"
        "status:in-progress:Currently being worked on"
        "status:blocked:Blocked by dependencies"
    )

    for label_spec in "${status_labels[@]}"; do
        IFS=':' read -r label desc <<< "$label_spec"
        if gh label list | grep -q "^${label}$"; then
            log_warn "Label '$label' already exists"
        else
            gh label create "$label" --description "$desc" --color "ffd700"
            log_success "Created label '$label'"
        fi
    done
}

# ============================================================================
# Create Milestones
# ============================================================================

create_milestones() {
    log_info "Setting up milestones..."

    declare -a milestones=(
        "Phase 01: Foundations"
        "Phase 02: [Curriculum Pending]"
        "Phase 03: [Curriculum Pending]"
        "Phase 04: [Curriculum Pending]"
        "Phase 05: [Curriculum Pending]"
    )

    for milestone in "${milestones[@]}"; do
        if gh milestone list | grep -q "^${milestone}$"; then
            log_warn "Milestone '$milestone' already exists"
        else
            gh milestone create --title "$milestone"
            log_success "Created milestone '$milestone'"
        fi
    done
}

# ============================================================================
# Create Issues from PROGRESS.md
# ============================================================================

create_issues() {
    log_info "Creating issues from PROGRESS.md..."

    # Phase 01: Module 2.4
    create_issue_if_not_exists \
        "[Phase 01] Learning: Complete Module 2.4 - GitHub Integration" \
        "Complete the GitHub Integration lesson in Phase 01 Module 2.4.

## Acceptance Criteria
- [ ] Lesson content complete in CLAUDE.md
- [ ] Key concepts documented
- [ ] Checkbox marked in PROGRESS.md

## Reference
PROGRESS.md: Module 2 → 2.4 GitHub Integration" \
        "phase:01" "type:learning" "status:ready" "Phase 01: Foundations"

    # Phase 01: Module 2.5
    create_issue_if_not_exists \
        "[Phase 01] Learning: Complete Module 2.5 - Go Live" \
        "Complete the Go Live lesson in Phase 01 Module 2.5.

## Acceptance Criteria
- [ ] Lesson content complete in CLAUDE.md
- [ ] Deployment concepts documented
- [ ] Checkbox marked in PROGRESS.md

## Reference
PROGRESS.md: Module 2 → 2.5 Go Live" \
        "phase:01" "type:learning" "status:ready" "Phase 01: Foundations"

    # Phase 01: crash-course-antigravity
    create_issue_if_not_exists \
        "[Phase 01] Exercise: Complete crash-course-antigravity" \
        "Develop the antigravity crash course extension.

## Context
Currently blocked pending curriculum definition.

## Acceptance Criteria
- [ ] Learning objectives defined
- [ ] Course content created
- [ ] Exercises and examples included
- [ ] Checkpoint marked in PROGRESS.md

## Reference
PROGRESS.md: Phase 01 → Learning Extensions" \
        "phase:01" "type:exercise" "status:blocked" "Phase 01: Foundations"

    # Phase 01: mini-projects
    create_issue_if_not_exists \
        "[Phase 01] Exercise: Create mini-projects" \
        "Develop mini-project suite for Phase 01.

## Context
Currently blocked pending curriculum definition. Should apply Claude Code concepts from modules 1.1-2.3.

## Acceptance Criteria
- [ ] Project list defined (3-5 projects)
- [ ] Project briefs and requirements created
- [ ] Success criteria defined
- [ ] Checkpoint marked in PROGRESS.md

## Reference
PROGRESS.md: Phase 01 → Learning Extensions" \
        "phase:01" "type:exercise" "status:blocked" "Phase 01: Foundations"

    # Phase 01: Extraction - agents
    create_issue_if_not_exists \
        "[Phase 01] Extraction: Extract agents from crash-course" \
        "Identify and extract reusable agent implementations from Phase 01 crash course lessons.

## Scope
Extract from lessons 1.5 (Agents) and 1.6 (Custom Sub-agents) into agents/ directory.

## Acceptance Criteria
- [ ] Agent implementations identified
- [ ] Code extracted to agents/ with documentation
- [ ] References to source material included
- [ ] Extracted artifacts added to PROGRESS.md

## Reference
PROGRESS.md: Extracted Artifacts → From Phase 01" \
        "phase:01" "type:extraction" "status:ready" "Phase 01: Foundations"

    # Phase 02: Curriculum
    create_issue_if_not_exists \
        "[Phase 02] Curriculum: Define Phase 02 learning objectives and structure" \
        "Define curriculum structure for Phase 02.

## Scope
Establish learning path, modules, objectives, and prerequisites for Phase 02.

## Acceptance Criteria
- [ ] Learning objectives defined
- [ ] Module structure created (planned lessons)
- [ ] Prerequisites from Phase 01 identified
- [ ] Success metrics defined
- [ ] Sub-issues created for each module

## Reference
PROGRESS.md: Phase 02-05 → Phase 02" \
        "phase:02" "type:curriculum" "status:blocked" "Phase 02: [Curriculum Pending]"

    # Phase 03: Curriculum
    create_issue_if_not_exists \
        "[Phase 03] Curriculum: Define Phase 03 learning objectives and structure" \
        "Define curriculum structure for Phase 03.

## Scope
Establish learning path, modules, objectives, and prerequisites for Phase 03.

## Acceptance Criteria
- [ ] Learning objectives defined
- [ ] Module structure created (planned lessons)
- [ ] Prerequisites from Phase 02 identified
- [ ] Success metrics defined
- [ ] Sub-issues created for each module

## Reference
PROGRESS.md: Phase 02-05 → Phase 03" \
        "phase:03" "type:curriculum" "status:blocked" "Phase 03: [Curriculum Pending]"

    # Phase 04: Curriculum
    create_issue_if_not_exists \
        "[Phase 04] Curriculum: Define Phase 04 learning objectives and structure" \
        "Define curriculum structure for Phase 04.

## Scope
Establish learning path, modules, objectives, and prerequisites for Phase 04.

## Acceptance Criteria
- [ ] Learning objectives defined
- [ ] Module structure created (planned lessons)
- [ ] Prerequisites from Phase 03 identified
- [ ] Success metrics defined
- [ ] Sub-issues created for each module

## Reference
PROGRESS.md: Phase 02-05 → Phase 04" \
        "phase:04" "type:curriculum" "status:blocked" "Phase 04: [Curriculum Pending]"

    # Phase 05: Curriculum
    create_issue_if_not_exists \
        "[Phase 05] Curriculum: Define Phase 05 learning objectives and structure" \
        "Define curriculum structure for Phase 05.

## Scope
Establish learning path, modules, objectives, and prerequisites for Phase 05.

## Acceptance Criteria
- [ ] Learning objectives defined
- [ ] Module structure created (planned lessons)
- [ ] Prerequisites from Phase 04 identified
- [ ] Success metrics defined
- [ ] Sub-issues created for each module

## Reference
PROGRESS.md: Phase 02-05 → Phase 05" \
        "phase:05" "type:curriculum" "status:blocked" "Phase 05: [Curriculum Pending]"

    # Admin: Sync
    create_issue_if_not_exists \
        "[Admin] Synchronize PROGRESS.md with GitHub Issues" \
        "Maintain bidirectional sync between PROGRESS.md (source of truth) and GitHub Issues.

## Context
This is a maintenance task. itinerary-pm agent handles sync automation.

## Acceptance Criteria
- [ ] PROGRESS.md checkboxes match GitHub issue states
- [ ] No orphaned issues without PROGRESS.md reference
- [ ] Timestamp in PROGRESS.md updated
- [ ] Drift detection completed

## Reference
PROGRESS.md: Sync Status
docs/github-tracking.md: Sync Protocol
.claude/agents/itinerary-pm.md: Sync automation" \
        "type:admin" "status:ready" "" "Phase 01: Foundations"
}

# ============================================================================
# Issue Creation Helper
# ============================================================================

create_issue_if_not_exists() {
    local title="$1"
    local body="$2"
    shift 2
    local labels=()
    local milestone=""

    # Parse remaining arguments as labels and milestone
    while [ $# -gt 0 ]; do
        if [[ "$1" == "Phase "* ]]; then
            milestone="$1"
        else
            labels+=("$1")
        fi
        shift
    done

    # Check if issue with this title already exists
    if gh issue list --search "title:\"$title\"" --state all | grep -q "$title"; then
        log_warn "Issue already exists: '$title'"
        return 0
    fi

    # Build gh issue create command
    local cmd="gh issue create --title \"$title\" --body \"$body\""

    # Add labels
    for label in "${labels[@]}"; do
        if [ -n "$label" ]; then
            cmd="$cmd --label \"$label\""
        fi
    done

    # Add milestone
    if [ -n "$milestone" ]; then
        cmd="$cmd --milestone \"$milestone\""
    fi

    # Execute command
    eval "$cmd" > /dev/null
    log_success "Created issue: '$title'"
}

# ============================================================================
# Main Execution
# ============================================================================

main() {
    echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}GitHub Tracking Bootstrap${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
    echo ""

    check_prerequisites
    echo ""

    create_labels
    echo ""

    create_milestones
    echo ""

    create_issues
    echo ""

    echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
    log_success "Bootstrap complete!"
    echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
    echo ""
    echo "Next steps:"
    echo "  1. Verify GitHub infrastructure:"
    echo "     gh label list"
    echo "     gh milestone list"
    echo "     gh issue list"
    echo ""
    echo "  2. Test sync with itinerary-pm agent:"
    echo "     /agent itinerary-pm"
    echo ""
}

main
