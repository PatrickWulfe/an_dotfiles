# Code Review

## Intent
Perform thorough code reviews following team standards.

## How to Use

When the user asks to review code:

1. **Identify the scope**
   - Run `git diff main...HEAD` to see changes
   - Run `git log main..HEAD --oneline` to see commits
   - List all changed files

2. **Per-file review** - For each changed file, check:
   - File is in correct directory with proper naming
   - Variable, function, class names are descriptive
   - Logic is correct with no missing edge cases
   - Code is modular without unnecessary duplication
   - Errors and exceptions are handled
   - No secrets or credentials in code
   - No obvious performance issues
   - Public APIs are documented
   - Test coverage for new/changed logic

3. **Overall review**
   - Change set is focused on stated purpose
   - No unrelated changes
   - Tests verify behavior, not just mocks

4. **Verify before claiming** — Before stating any finding, read the actual source:
   - If claiming a class lacks value equality, read its definition to check for `Equatable` or `==` override
   - If claiming a null value is unhandled, check the type signature and all call sites
   - If claiming a missing state guard, confirm the bloc's event transformer allows concurrent handlers
   - If claiming a test no longer covers a scenario, read the full test file to check for equivalent coverage
   - **Never assume based on pattern alone. Always read the relevant file first.**

5. **Output**
   - Provide findings per file
   - Give specific suggestions for improvement
   - Note any questions or clarifications needed
   - Only include findings you have verified against the actual source code

## Examples

**Review current branch**
User: "Review my changes" → Run git diff, analyze each file, provide feedback

**Review specific PR**
User: "Review PR 123" → Fetch PR details with `az repos pr show --id 123`, then review
