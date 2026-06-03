---
inclusion: fileMatch
fileMatchPattern: "packages/gather_api/lib/**/*_resource.dart"
---

# Gather API Resource Rules

## Error Handling
- Do not wrap endpoint methods in `try`/`catch`. Let exceptions from `_client` (and JSON parsing) propagate to the caller.
- Callers (repositories, blocs/cubits) are responsible for handling errors and distinguishing failure modes.
- Applies to all methods in `*_resource.dart` files under `packages/gather_api/`.
