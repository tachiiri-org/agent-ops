# Principles Documents

This directory is the canonical home for shared architectural principles.

## Reading Order

1. Read `core.md`.
2. Read the role-specific document that matches the repository role:
   - `front.md`
   - `bff.md`
   - `gateway.md`
   - `adapter.md`
   - `electron.md`
   - `python.md`
   - `ops.md`
3. Read companion documents from this directory as needed for the task scope:
   - `identity-and-access.md`
   - `operations-and-delivery.md`
   - `compatibility-and-change.md`
   - `observability-and-trust.md`
   - `tenant-safety.md`
   - `browser-boundary.md`
   - `spec-governance.md`
   - `ops-governance.md`
4. Use `../architecture.mmd` for topology context when needed.

## Responsibility Split

- `core.md`
  - shared architectural principles
  - cross-cutting semantic summary
  - reading map for companion documents
- companion docs
  - high-density cross-cutting semantics without role duplication
- role docs
  - role-specific responsibilities
  - role-specific prohibitions
  - how the role applies the shared core principles

## Authoring Rules

- Keep `core.md` free of role-specific implementation detail and use it as a navigation layer.
- Keep role docs free of duplicated core semantics unless the role adds a stricter rule.
- Add dense cross-cutting semantics to the appropriate companion document, then summarize them in `core.md`.
- Add new role-local guidance to the corresponding role document.
