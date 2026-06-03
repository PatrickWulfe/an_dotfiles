---
inclusion: fileMatch
fileMatchPattern: "**/*.dart,**/pubspec.yaml"
---

# Dart & Flutter Coding Standards

## Code Style & Conventions
- Prefer single quotes for strings (`'hello'`), unless the string contains a single quote.
- Use trailing commas for multi-line argument lists (improves formatting and diffs).
- NEVER use `ignore_for_file` tags. Keep ignore tags specific to the code they're affecting and add a comment on why the ignore tag was necessary. Ignore tags should only be used when absolutely necessary.

## Widget Design
- Prefer **composition over inheritance** — build small, reusable widgets.
- Avoid deeply nested widget trees — flatten by extracting into dedicated widget classes.
- Prefer `StatelessWidget` unless local mutable state is required.
- Use `Key` parameters when widget identity matters (e.g., lists, animations).

## Architecture & Structure
- Follow a **feature-first** folder structure:
  - Each feature lives in its own directory under `lib/` (e.g., `lib/home/`, `lib/vehicle_profile/`).
  - Features contain: `bloc/`, `view/`, `widgets/`, and optionally `extensions/`, `models/`.
  - **Subfeatures** are allowed with a **maximum of 1 level deep** via a `subfeatures/` directory (e.g., `lib/home/subfeatures/onboarding_checklist/`). Do not nest subfeatures further.
  - Export feature contents via a barrel file named after the feature (e.g., `home.dart`).
- **Repositories** live in `packages/` as separate Dart packages (e.g., `packages/user_repository/`).
  - Repositories may contain **subrepositories** for related domain logic (e.g., `user_repository/lib/src/subrepositories/user_gatherings_subrepository.dart`).
  - Subrepositories are **maximum 1 level deep** — do not nest subrepositories within subrepositories.
- Separate concerns: UI (widgets/views), logic (blocs/cubits), data (repositories/subrepositories), models.
- Use **dependency injection** via `RepositoryProvider` and `BlocProvider` from `flutter_bloc`.
- Keep `main.dart` minimal — delegate setup to dedicated bootstrap/configuration files.

## Null Safety & Types
- Embrace **sound null safety** — avoid `!` unless you're certain; prefer null checks or `??`.
- **Prefer pattern matching over null check operators** — use `if (value case final v?)` or `switch` expressions instead of `value != null` or `value!`.
- Prefer `required` named parameters for clarity.
- Use `sealed` classes (Dart 3+) for exhaustive pattern matching.

## Error Handling
- Use `try/catch` with specific exception types.
- Prefer `Result` types, `ValueWrapper` with status enums, or `Either` (from `fpdart` or `dartz`) for expected failures.
- Avoid swallowing exceptions silently — log or propagate meaningfully.

## Testing
- Mirror the `lib/` folder structure in `test/` — each feature has a corresponding test directory.
- Separate test files for bloc, event, and state (e.g., `home_bloc_test.dart`, `home_event_test.dart`, `home_state_test.dart`).
- **Widget tests:**
  - Use `WidgetTester` extensions (e.g., `pumpTestableWidget`, `pumpRoute`, `pumpTestableWidgetWithOverriddenInnerRouteWidget`) to pump widgets with required providers and routing context.
  - Provide mock repositories and blocs via the test helper parameters.
- **Mocking:**
  - Use `mocktail` for mocking dependencies.
  - Create mock classes prefixed with `Mock` (e.g., `MockUserRepository`) or `_Mock` for file-private mocks.
  - Use `Fake` classes for simple stubs that don't need verification.
  - Register fallback values in `setUpAll` for custom types used with `any()`.
- **Test helpers:**
  - Centralize reusable test utilities in `test/helpers/` (e.g., `pump_app.dart`, `mocks/`, `fakes/`, `fallback_values/`).
  - Use `pumpEventQueue()` to allow async bloc events to complete.
- **Assertions:**
  - Use `expect()` with matchers like `isA<T>()`, `equals()`, `.having()` for granular assertions.
  - Use `verify()` and `verifyNever()` to assert mock interactions.
  - Aim for high coverage on critical paths (blocs, repositories); don't chase 100% blindly.

## Performance
- Avoid rebuilding large widget subtrees — use `Selector`, `BlocSelector`, or `BlocBuilder` with `buildWhen`.
- Use `ListView.builder` / `GridView.builder` for long lists.
- Profile with DevTools before optimizing prematurely.

## Packages & Dependencies
- Prefer well-maintained, popular packages from pub.dev.
- Pin versions in `pubspec.yaml` for reproducibility.
- Keep dependencies minimal — avoid bloat.

## Accessibility
- Provide `Semantics` widgets for accessibility.
