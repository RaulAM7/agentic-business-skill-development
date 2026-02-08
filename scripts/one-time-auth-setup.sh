#!/bin/bash

# One-Time GitHub Authentication Setup
#
# This script updates your GitHub CLI token with required scopes.
# Run this ONCE on your local machine (requires browser interaction)
#
# After running this, all other scripts will work automatically.
#
# Usage: ./scripts/one-time-auth-setup.sh

set -euo pipefail

echo "=========================================="
echo "GitHub CLI Token Scope Update"
echo "=========================================="
echo ""
echo "This will grant your GitHub token the required scopes:"
echo "  + project (create and manage projects)"
echo "  + read:project (read project data)"
echo ""
echo "Your browser will open. Follow the authorization flow."
echo ""
read -p "Press Enter to continue..." dummy

# Update auth scopes
gh auth refresh -s project,read:project

echo ""
echo "=========================================="
echo "✓ Token scopes updated successfully!"
echo "=========================================="
echo ""
echo "You can now run:"
echo "  ./scripts/setup_github_project.sh"
echo ""
