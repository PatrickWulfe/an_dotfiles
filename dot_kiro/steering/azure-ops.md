---
inclusion: manual
---

# Azure Ops

## Intent
This steering file automates common Azure DevOps tasks using bundled scripts.

## Prerequisites
- Azure CLI (`az`) must be installed
- User must be logged in via `az login`
- Azure DevOps extension configured with default organization and project

## How to Use

When the user asks to list, create, or inspect work items:
- Run `.claude/skills/azure-ops/scripts/list-tasks.sh`
- Run `.claude/skills/azure-ops/scripts/create-task.sh "<title>" ["<description>"]`
- Run `.claude/skills/azure-ops/scripts/show-task.sh <id>`

When creating a branch:
- Run `.claude/skills/azure-ops/scripts/create-branch.sh <feature|fix> <id>`

When creating a pull request:
1. Read the PR template at `.azuredevops/PULL_REQUEST_TEMPLATE.md`
2. Analyze the changes using `git diff origin/main...HEAD` and `git log origin/main..HEAD`
   - **ALWAYS use `origin/main` as the base**, never the local `main` branch. The local `main` may be stale, and branches with merge commits from main will produce a polluted diff against a stale local ref.
3. Determine the PR title using format `type(scope): short description`
   - Use `gather_api` scope for: `gather_auth`, `storage`, `http_utils` packages
   - Use `gather_app` scope for: root-level config changes
4. Fill in the template sections:
   - **Why**: Explain the problem being solved (1-2 sentences)
   - **What**: Describe the solution implemented (1-2 sentences)
   - **Type of Change**: Put an `x` in the appropriate checkbox. Keep ALL checkbox options intact.
   - **Production Readiness**: **Do NOT fill this automatically.** Before creating the PR, ask the user: "If we built main today, would this change be ready for end users? (1) Ready for production, (2) Behind a feature flag, or (3) Not applicable (chore, refactor, docs)?" If they choose option 2, ask which flag name controls this change.
   - **Related Links**: Add relevant links or mark N/A
   - **Screenshots**: Mark N/A (user can add later)
   - **How to test**: Provide testing steps
5. Run `.claude/skills/azure-ops/scripts/create-pr.sh <work-item-id> "<title>" "<description>"`

## Examples

**List my open tasks**
User: "Show me my tasks." → `.claude/skills/azure-ops/scripts/list-tasks.sh`

**Create a new task**
User: "Create a task to fix the footer." → `.claude/skills/azure-ops/scripts/create-task.sh "Fix footer"`

**Make a branch for work item 12345**
User: "Create a feature branch for 12345." → `.claude/skills/azure-ops/scripts/create-branch.sh feature 12345`

**Create a PR linked to work item 12345**
User: "Create a PR for 12345." → Analyze changes, construct description from template, then run the script
