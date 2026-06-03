---
inclusion: manual
---

# Widget Mapping: Figma to Widget using gather_ui Components

## When to Use

**ALWAYS** when creating, building, or converting Flutter screens from Figma designs via Figma MCP.

## Inputs

Before proceeding, ensure both inputs are available:

- **Figma link:** A `figma.com/design/...` URL with a `node-id`. If not provided, ask for it before doing anything else.
- **Target location:** The file or folder where the code should be placed or updated.
    - **Folder:** Create the screen/widget under this path following the project's feature structure.
    - **File:** Treat it as an existing implementation to update; refactor it to match the Figma design.
    - If not provided, ask: *"Where should this go? A folder for new code, or a file to update?"*

**Cancel the task** if no Figma link is provided or if fetching the design context fails. Never guess or invent the design.

## Scope

UI only — screens, widgets, layout, styling. Do **not** add repositories, sources, blocs, or any state management unless the user explicitly asks.

## Guidelines Reference

Before generating any code, read these guidelines:

1. **Rules:** `guidelines/ui/widget-mapping/RULES.md`
2. **Component Map:** consult only the relevant files in `guidelines/ui/widget-mapping/components/` based on the components identified in the Figma design (e.g., `buttons.md` for buttons, `inputs.md` for inputs). See `guidelines/ui/widget-mapping/components/README.md` for the full index.
3. **Colors:** `guidelines/ui/colors.md`
4. **Icons:** `guidelines/ui/icons.md`
5. **Spacing:** `guidelines/ui/spacing.md`
6. **Typography:** `guidelines/ui/typography.md`
7. **Localization:** `guidelines/ui/localization.md`

## Mandatory Workflow

### 1. Parse the Figma link

From URLs like `https://figma.com/design/{fileKey}/{fileName}?node-id=1-2`, extract:

- **fileKey:** the design file key (e.g. `ABC123`)
- **nodeId:** the target node, with `-` replaced by `:` (e.g. `1-2` → `1:2`). If no `node-id` is given, fetch metadata first to find the correct node.

### 2. Fetch design context

- **Prefer `get_design_context`** with `nodeId` and `fileKey` — use `clientLanguages: "dart"` and `clientFrameworks: "flutter"`.
- **Use `get_screenshot`** when you need a visual reference to understand layout or styling.
- **Use `get_metadata`** only for a quick structural overview (e.g. to discover node IDs on a page).

### 3. Map every component to a widget

A screen is composed of many components. For **each** component in the design:

1. **Identify all visual components** in the Figma design — a screen is typically composed of multiple `gather_ui` widgets working together
2. **For each component**, consult `guidelines/ui/widget-mapping/COMPONENT_MAP.md` to find the correct `gather_ui` widget
3. **If not found** in the map, browse `packages/gather_ui/lib/` to search for a match
4. **If still not found**, ASK the user — never invent or use a generic Flutter widget.
5. **Only then** generate code using the correct `gather_ui` widget
6. **Never** invent a custom widget when a `gather_ui` widget exists for that component

### 4. Implement in Flutter

- **Components:** Use `gather_ui` widgets as the primary component library, with plain Flutter layout primitives for structure and spacing.
- **Structure:** Place new UI under `projects/gather_app/lib/` following the feature structure (e.g. `features/my_feature/presentation/` and `features/my_feature/widgets/`). Use **private widget classes** — never methods that return widgets.
- **Styling:** Follow `guidelines/ui/colors.md`, `guidelines/ui/spacing.md`, and `guidelines/ui/widget-mapping/RULES.md`.
- **Localization:** All user-visible strings must be localized. Access via `final l10n = context.l10n;`. Add new keys to `app_en.arb` with a `description`. See `guidelines/ui/localization.md`.

### 5. Integrate into the app

If the design is a new screen, wire it up following the existing navigation/routing patterns in the codebase. Do not invent new patterns — find and reuse what already exists.

## Checklist Before Finishing

- [ ] Only UI/presentation code added or changed; no new repositories, data sources, or state management unless requested
- [ ] All components mapped to `gather_ui` widgets; plain Flutter used only for layout primitives
- [ ] Colors use tokens from `guidelines/ui/colors.md`; no hardcoded hex values
- [ ] Spacing uses constants from `guidelines/ui/spacing.md`; no magic numbers
- [ ] Icons use the correct identifiers from `guidelines/ui/icons.md`
- [ ] Private widget classes used — no methods that return widgets
- [ ] All user-visible strings localized via `context.l10n`; no hardcoded text
- [ ] New ARB keys added to `app_en.arb` with `description` metadata, sorted alphabetically
- [ ] Figma node implemented matches the requested node (correct fileKey and nodeId)

## Optional: Code Connect

If the design has Code Connect mappings, use **`get_code_connect_map`** with the same `fileKey` and `nodeId` to discover linked components. Prefer those matches when they align with `gather_ui` widgets.

## Correction Flow

When the user corrects a mapping (e.g., "that's not the right widget, use `ANXyz.abc()`"):

1. Acknowledge the correction
2. Show the before/after change clearly
3. Ask the user whether this is a **general mapping** (applies to all future uses of this Figma component) or a **special case** (one-off usage specific to this context)
4. If it's a general mapping, update `guidelines/ui/widget-mapping/COMPONENT_MAP.md`
5. If it's a special case, apply the correction locally but do **not** update the map
