# GitHub Project Setup Instructions

To create and organize the Learning Path Progress project, you need to grant your GitHub CLI token the required scopes.

## Prerequisites

Your current token scopes:
```
✓ admin:public_key
✓ gist
✓ read:org
✓ repo
```

Required additional scopes:
```
+ project (create and manage projects)
+ read:project (read project data)
```

## Step 1: Update GitHub Token Scopes

Run this command to refresh your authentication with the required scopes:

```bash
gh auth refresh -s project,read:project
```

This will:
1. Open a browser to GitHub authentication
2. Ask you to authorize the additional scopes
3. Return to the terminal with updated token

**Note:** You may need to go through the authorization flow if this is your first time granting project scopes.

## Step 2: Run Project Setup Script

After updating your token, run:

```bash
./scripts/setup_github_project.sh
```

This script will:
1. ✓ Validate GitHub CLI authentication with project scopes
2. ✓ Create a new project called "Learning Path Progress"
3. ✓ Add all 10 issues to the project
4. ✓ Organize issues by phase (if possible)

## Step 3: Verify Project Creation

Check the project was created:

```bash
gh project list --owner RaulAM7
```

View the project in GitHub UI:

```bash
gh project view <project-number> --owner RaulAM7 --web
```

## Project Organization

Once the project is created, you can organize issues in GitHub UI:

### By Phase
- **Phase 01: Foundations** (4 issues)
  - #11 Module 2.4 Learning
  - #12 Module 2.5 Learning
  - #13 crash-course-antigravity (blocked)
  - #14 mini-projects (blocked)
  - #15 Extraction agents (ready)

- **Phase 02-05** (5 issues)
  - #16-19 Curriculum definition (blocked)

### By Status
- **Ready** (3 issues): #11, #12, #15, #20
- **Blocked** (6 issues): #13, #14, #16, #17, #18, #19
- **In Progress** (0 issues)

### By Type
- **Learning** (2 issues): #11, #12
- **Exercise** (2 issues): #13, #14
- **Extraction** (1 issue): #15
- **Curriculum** (4 issues): #16, #17, #18, #19
- **Admin** (1 issue): #20

## Manual Configuration (if needed)

If the setup script cannot fully configure the project, you can manually:

1. Open the project in GitHub
2. Create custom fields for:
   - Phase (single select: 01, 02, 03, 04, 05)
   - Status (single select: ready, in-progress, blocked)
   - Type (single select: learning, exercise, extraction, curriculum, admin)

3. Edit each issue and set the appropriate field values

## Troubleshooting

### "Your token has not been granted the required scopes"

Run: `gh auth refresh -s project,read:project`

Then verify with: `gh auth status`

### "Project creation failed"

Check:
1. Your token has the `project` scope
2. You have admin access to the repository
3. Run: `gh auth status --show-token`

### Issues not added to project

- Verify issues exist: `gh issue list --limit 100`
- Check project ID is correct in script output
- Try manually adding issues in GitHub UI

## Cleanup (if needed)

To delete the project and start over:

```bash
gh project delete <project-number> --owner RaulAM7
```

Then re-run: `./scripts/setup_github_project.sh`
