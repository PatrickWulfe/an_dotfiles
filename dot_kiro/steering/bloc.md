---
inclusion: fileMatch
fileMatchPattern: "**/*_bloc.dart,**/*_bloc_test.dart,**/*_cubit.dart,**/*_cubit_test.dart"
---

# Bloc Rules

## Naming Conventions
- Name events in past tense (e.g., `LoginButtonPressed`, `UserProfileLoaded`)
- For initial load events: `BlocSubjectStarted` (e.g., `AuthenticationStarted`)
- Base event class: `BlocSubjectEvent`
- Name states as nouns (snapshot at a point in time)
- State subclasses: `BlocSubject` + `Initial` | `Success` | `Failure` | `InProgress`
- Single-class states: `BlocSubjectState` with `BlocSubjectStatus` enum

## Modeling State
- Extend `Equatable` for all state classes
- Annotate with `@immutable`
- Implement `copyWith` method for state updates
- Use `const` constructors when possible
- Use sealed class with subclasses for exclusive states
- Use single class with status enum for shared properties
- Pass all properties to `props` getter with Equatable
- Copy List/Map with `List.of`/`Map.of` for value equality

## Bloc Concepts
- Use `Cubit` for simple state; `Bloc` for event-driven complexity
- Only call `emit` inside Cubit/Bloc
- Keep business logic out of UI widgets
- For blocs: trigger state changes by adding events, not public methods
- For cubits: public methods should return `void` or `Future<void>`

## Architecture
- Three layers: Presentation, Business Logic, Data
- Inject repositories into blocs via constructors
- Avoid direct bloc-to-bloc communication
- Use BlocListener to coordinate between blocs

## Flutter Bloc Widgets
- `BlocBuilder`: rebuild widgets on state changes
- `BlocListener`: side effects (navigation, dialogs)
- `BlocConsumer`: both builder and listener
- `BlocSelector`: rebuild on specific state part changes
- `context.read<T>()`: access without listening (callbacks)
- `context.watch<T>()`: listen and rebuild (build method)

## Testing
- Use `bloc_test` package
- Test initial state first
- Use `blocTest` for state transitions
- Assert expected sequence of emitted states
- Mock blocs in widget tests
