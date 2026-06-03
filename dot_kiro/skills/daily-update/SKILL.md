---
name: daily-update
description: Generates a daily standup update summarizing PR activity since the last standup. Use when the user asks for a daily update, standup summary, or end-of-day recap. Do not use for creating or modifying PRs.
---

# Daily Update

## Purpose

Generate a concise daily update summarizing the user's Azure DevOps pull request activity since the last standup. The output is ready to paste into a team channel.

## Use This Skill When

- The user asks for a daily update, standup summary, or EOD recap
- The user wants to know what they worked on today or since last standup

## Do Not Use This Skill When

- The user wants to create, update, or review a PR (use `azure-ops` instead)
- The task is about work items, branches, or deployments

## Time Window

Calculate the lookback window based on the current day of the week:

- **Tuesday–Friday**: 24 hours (since yesterday's standup)
- **Monday**: 72 hours (covers Saturday, Sunday, and Monday morning)

If the user specifies a different window (e.g., "since Thursday"), use that instead.

## Workflow

### 1. Determine the Lookback Window

Use the current day of the week to decide the `fromDate` for commit and PR queries. Format as ISO 8601.

### 2. List the User's Authored PRs

Use `mcp_ado_org_repo_list_pull_requests_by_repo_or_project` with:

- `created_by_me: true`
- `status: "All"` (to catch PRs completed today as well)
- Scope to the project if known, otherwise search across the organization

Filter results to PRs that were **created or updated** within the lookback window.

### 3. List PRs the User Reviewed

Use `mcp_ado_org_repo_list_pull_requests_by_repo_or_project` with:

- `i_am_reviewer: true`
- `status: "All"`

Filter results to PRs where the user is **not** the author and that were **updated** within the lookback window. These are PRs the user commented on, approved, or rejected.

### 4. For Each Relevant PR, Gather Details

For each PR in the filtered list (both authored and reviewed):

1. **Get PR metadata** via `mcp_ado_org_repo_get_pull_request_by_id` with `includeChangedFiles: true`
2. **Get review threads** via `mcp_ado_org_repo_list_pull_request_threads` to capture feedback received or addressed
3. **For authored PRs**: get recent commits via `mcp_ado_org_repo_search_commits` filtered by author and the lookback `fromDate`
4. **For reviewed PRs**: focus on threads authored by the user to summarize feedback given

### 5. Summarize Activity

**For authored PRs**, extract:

- PR title and ID
- Current status (Active, Completed, has reviewers approved, etc.)
- Brief description of what changed (from PR description or file list)
- Key activity: new commits pushed, review comments addressed, approvals received
- Any blockers or outstanding review requests

**For reviewed PRs**, extract:

- PR title, ID, and author
- What the user did: approved, rejected, left comments, requested changes
- Brief one-liner on what the PR is about

### 6. Format the Output

Wrap the entire update inside a markdown code block (triple backticks) so the user can easily copy/paste it into their team channel.

Use this template:

````
```
## Daily Update — {date}

### PRs Worked On

**#{id} — {title}** ({status})
- {summary of changes}
- {activity bullet: e.g., "Addressed 3 review comments", "Pushed 2 commits", "Approved by @reviewer"}

**#{id} — {title}** ({status})
- {summary of changes}
- {activity bullet}

### PRs Reviewed

**#{id} — {title}** (by {author})
- {action: e.g., "Approved", "Left 4 comments", "Requested changes"}

### Blockers / Needs Attention
- {any PRs waiting on review, failing checks, or stalled — or "None"}
```
````

If there are no PRs with activity in the window, output:

````
```
## Daily Update — {date}

No PR activity since last standup.
```
````

## Guidelines

- Keep each PR summary to 2–3 bullets max
- Use plain language, not commit hashes or file paths
- Group authored PRs under "PRs Worked On" and reviewed PRs under "PRs Reviewed"
- Group completed PRs separately from in-progress ones if both exist within a section
- If a PR was both opened and completed in the window, note that
- For reviewed PRs, summarize the user's action (approved, commented, requested changes) not the PR's full diff

## Verification

- Every PR listed had activity within the calculated lookback window
- Status accurately reflects the current PR state
- No sensitive information (secrets, internal URLs) leaks into the summary
