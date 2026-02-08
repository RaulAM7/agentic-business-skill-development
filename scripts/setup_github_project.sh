#!/bin/bash

# GitHub Project Setup Script
#
# Creates a GitHub Project and adds all issues to it
#
# Prerequisites:
# - GitHub CLI authenticated with 'project' and 'read:project' scopes
# - Run: gh auth refresh -s project,read:project
#
# Usage: ./scripts/setup_github_project.sh

set -euo pipefail

# ============================================================================
# Configuration
# ============================================================================

PROJECT_TITLE="Learning Path Progress"
PROJECT_DESCRIPTION="Organized tracking for learning path phases and extraction tasks"

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

# ============================================================================
# Check Prerequisites
# ============================================================================

check_prerequisites() {
    log_info "Checking prerequisites..."

    # Check gh auth with project scope
    if ! gh auth status --show-token 2>&1 | grep -q "project"; then
        log_error "Token missing 'project' scope"
        echo ""
        echo "To add project scope, run:"
        echo "  gh auth refresh -s project,read:project"
        echo ""
        exit 1
    fi
    log_success "GitHub CLI authenticated with project scope"
}

# ============================================================================
# Get Repository Info
# ============================================================================

get_repo_info() {
    log_info "Getting repository information..."

    REPO_OWNER=$(gh repo view --json owner -q ".owner.login")
    REPO_NAME=$(gh repo view --json name -q ".name")

    log_success "Owner: $REPO_OWNER"
    log_success "Repo: $REPO_NAME"
}

# ============================================================================
# Create Project
# ============================================================================

create_project() {
    log_info "Creating GitHub Project: $PROJECT_TITLE"

    # Create project using gh project create
    PROJECT_ID=$(gh project create \
        --title "$PROJECT_TITLE" \
        --owner "$REPO_OWNER" \
        --format json \
        -q '.id' 2>/dev/null)

    if [ -z "$PROJECT_ID" ]; then
        log_error "Failed to create project"
        exit 1
    fi

    log_success "Project created: $PROJECT_ID"
    echo "$PROJECT_ID"
}

# ============================================================================
# Add Issues to Project
# ============================================================================

add_issues_to_project() {
    local project_id="$1"

    log_info "Adding issues to project..."

    # Get all issues
    while IFS=$'\t' read -r issue_number issue_title; do
        # Add issue to project
        if gh project item-add "$project_id" --id "$issue_number" 2>/dev/null; then
            log_success "Added issue #$issue_number to project"
        else
            log_warn "Could not add issue #$issue_number (may already be in project)"
        fi
    done < <(gh issue list --limit 100 --state all --json number,title -q '.[] | "\(.number)\t\(.title)"')
}

# ============================================================================
# Organize Project by Phase
# ============================================================================

organize_by_phase() {
    local project_id="$1"

    log_info "Organizing project by phase..."

    # Create or get "Phase" field
    PHASE_FIELD=$(gh api graphql -f query='
    query {
      projectV2(number: '$project_id', owner: "$REPO_OWNER") {
        fields(first: 20) {
          nodes {
            ... on ProjectV2Field {
              id
              name
            }
          }
        }
      }
    }
    ' --raw-field projectNumber="$project_id" 2>/dev/null | grep -i phase || echo "")

    if [ -z "$PHASE_FIELD" ]; then
        log_warn "Could not organize by phase (field may need to be created manually in GitHub UI)"
    fi
}

# ============================================================================
# Main Execution
# ============================================================================

main() {
    echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}GitHub Project Setup${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
    echo ""

    check_prerequisites
    echo ""

    get_repo_info
    echo ""

    PROJECT_ID=$(create_project)
    echo ""

    add_issues_to_project "$PROJECT_ID"
    echo ""

    organize_by_phase "$PROJECT_ID"
    echo ""

    echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
    log_success "Project setup complete!"
    echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
    echo ""
    echo "Next steps:"
    echo "  1. View project: gh project view $PROJECT_ID --owner $REPO_OWNER"
    echo "  2. Open in browser: gh project view $PROJECT_ID --owner $REPO_OWNER --web"
    echo "  3. Organize issues by phase/status in GitHub UI"
    echo ""
}

main
