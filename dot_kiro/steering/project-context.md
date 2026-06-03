---
inclusion: auto
description: Core project context, monorepo workflow rules, coding conventions, and available steering index
---

# Project Context

This repository uses steering files under `~/.kiro/steering/` to automate operational workflows
related to Azure DevOps work items, Git branches, and pull requests.

## General Behavior
- Be professional, direct, and concise.
- Ask clarification questions when required.
- Do not perform destructive actions without explicit confirmation.
- Do not retype commands already available as scripts.
- **Never guess or fabricate values** (API response strings, endpoint paths, config keys, error messages, enum variants, etc.) that cannot be verified from the codebase or documentation. If a value is unknown, ask the user to provide it. Placeholder or speculative values are not acceptable — they create silent bugs.

## Monorepo Workflow
This is a monorepo with multiple packages. Work on **one package at a time**.

When a feature requires changes to a shared package (e.g., `gather_ui`):
1. First PR: Make changes to the shared package (`gather_ui`)
2. Use path imports temporarily to test changes locally in the consuming app
3. Once the shared package PR is merged and deployed, create a second PR for the consuming app (`gather_app`)

Never bundle changes across multiple packages into a single PR.

## Available Steering (manual inclusion)
- `azure-ops` — Azure DevOps workflows for tasks, branches, and PRs
- `widget-mapping-gather-ui` — Maps Figma components to `gather_ui` Flutter widgets.

Use these automatically when user intent matches their domain.

## Guidelines
This project uses shared guidelines under `guidelines/` as the single source of truth for coding standards. These guidelines are referenced by all AI tools and developers.

- **UI guidelines:** `guidelines/ui/` — colors, icons, spacing, widget mapping, and any other UI-related standards. When working on anything UI-related, always check this directory for applicable guidelines.

## Figma Integration Rule
**Whenever a Figma URL (`figma.com/design/...`) is provided in this project**, you MUST:
1. **Read** the `widget-mapping-gather-ui` steering file — it contains the full workflow and references all required guidelines
2. **Then** proceed with the Figma MCP tools (`get_design_context`, etc.)

This ensures all generated Flutter code uses `gather_ui` widgets instead of generic Flutter widgets.
The skill applies to **any** Figma-to-code workflow: implementing screens, reviewing designs, or building components.

## Coding Conventions
- **Alpha sort everything**: Always alphabetically sort constructor parameters, named arguments at call sites, switch/case branches, and import statements.
- **Use `isNotNullOrEmpty`/`isNullOrEmpty`** from `string_helper.dart` instead of manual null/empty checks on nullable strings.
- **Enums must include an `unknown` value**: every `enum` must declare `unknown` as the last value. JSON deserialization should map unrecognized strings to `unknown`, **unless the API spec defines a different default value for that enum**, in which case unrecognized values map to the spec-defined default (e.g. `MetadataGroupTypeData.fromJson` falls back to `all` per Swagger).

## Code Formatting
Before creating any git commit, always run code formatting and analysis in the `projects/gather_app` directory:
```bash
cd projects/gather_app && melos exec -- "dart format . --line-length 80"
cd projects/gather_app && melos exec -- "dart analyze"
```
Then stage any formatting changes with `git add -u` before committing.
