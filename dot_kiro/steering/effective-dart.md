---
inclusion: fileMatch
fileMatchPattern: "**/*.dart"
---

# Effective Dart

## Naming Conventions
- Types, extensions: `UpperCamelCase`
- Packages, directories, files: `lowercase_with_underscores`
- Variables, parameters: `lowerCamelCase`
- Capitalize acronyms >2 letters like words (e.g., `HttpRequest`)
- Avoid abbreviations unless more common than full term
- Boolean properties: non-imperative verb phrase, positive form (e.g., `isEnabled` not `isDisabled`)

## Types and Functions
- Type annotate variables without initializers
- Annotate return types and parameters on function declarations
- Use `Future<void>` for async members that don't produce values
- Use getters/setters for property-like operations
- Use inclusive start and exclusive end for ranges

## Style
- Format with `dart format`
- Use curly braces for all flow control
- Prefer `final` over `var` when values won't change
- Use `const` for compile-time constants

## Imports
- Don't import from `src/` of another package
- Prefer relative imports within a package
- Don't use `/lib/` or `../` in import paths

## Structure
- Keep files focused on single responsibility
- Prefer `final` for fields and top-level variables
- Use `const` constructors when class supports it
- Prefer private declarations

## Usage
- Use collection literals when possible
- Use `whereType()` to filter by type
- Initialize fields at declaration when possible
- Use initializing formals
- Use `;` instead of `{}` for empty constructor bodies
- Override `hashCode` if you override `==`

## Documentation
- Use `///` doc comments for public APIs
- Start with single-sentence summary
- Document why code exists, not just what it does

## Performance
- Use `const` constructors when possible
- Avoid expensive operations in build methods
- Implement pagination for large lists
