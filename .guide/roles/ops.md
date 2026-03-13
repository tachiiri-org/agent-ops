# ops.md

- Provide principles, CLAUDE.md, and skills as shared context for Claude and Codex.
- Define and maintain settings.json and command definitions.
- Update Claude commands and Codex skills together whenever either side changes.
- Own branch strategy (main / dev / feature) across repositories.
- Own release and deploy command definitions.
- Designed to be pulled into other repositories as a development standard layer.
- Keep release, rollback, abort, and emergency semantics explicit in shared guidance.
- Do not allow configuration or environment differences to redefine shared semantics silently.
- Keep incident-bound exceptions time-bounded, auditable, and removable.
- Keep packaging and distribution tooling separate from shared principle content.
- Keep compatibility windows, version acceptance, and sunset policy explicit when shared semantics evolve.
- Keep issuer allowlists, rotation overlap, and role/scope lifecycle governance explicit when identity semantics evolve.
- Keep support, break-glass, and emergency work operation-based and incident-bound.
- Do not normalize security or dependency incidents into ordinary release work.
- Keep retention, residency, restore, and audit-storage expectations explicit when data-handling semantics evolve.
- Keep global-resource exceptions and directory/org semantics explicit rather than letting them drift into hidden defaults.
- Keep disaster-recovery behavior tenant-safe, auditable, and semantically aligned with normal operation.
- Use `setup-<axis>-<name>` naming for setup commands and skills.
- Keep setup axes limited to `role`, `runtime`, `tool`, `idp`, `provider`, and `dev`.
- Keep `setup-role-*` focused on the minimum role baseline only.
- Keep `setup-runtime-*`, `setup-tool-*`, `setup-idp-*`, `setup-provider-*`, and `setup-dev-*` modular and composable.
- Do not encode multiple setup axes into one new command name when composition can express the same result.
- Use `setup-dev-github` for repository-bootstrap and development-platform tasks.
- Use `setup-provider-github` only for adapter-facing GitHub integration work.
- Do not mix development-platform bootstrap with adapter-provider integration in one setup module.
- Prefer current axis-based setup names over legacy mixed-axis names.

## Delivery and Merge Gate

- Own `feature -> dev` delivery automation for repositories that act as shared ops and guidance layers.
- Own pull-request-only merge policy and release-path governance for shared ops repositories.
- Treat shared validation workflows, required checks, and `dev` merge-gate policy as role-owned concerns for ops repositories.
- Treat merge to `main` as the release path for shared guidance changes.
- Do not push directly to `main`.
- Use pull requests for all merges.
- Keep shared guidance authoring in `roles/ops.md`; setup should own only the automation surface and merge gate.
- Let `setup-runtime-ops` own:
  - shared validation workflow definitions
  - the `validate-shared-ops` required check
  - `dev` branch-protection and auto-merge readiness

## Validation Constraints

- Keep mirrored command and skill surfaces synchronized.
- Keep validation broad enough to catch broken templates, scripts, and shared configuration before merge to `dev`.
- Keep required check names stable because downstream repos may rely on the shared guidance.
- Keep the validation workflow authoritative for `dev` branch protection.
- Do not treat manual spot checks as a substitute for the role-owned validation workflow.
- Keep auto-merge readiness tied to the `validate-shared-ops` check.

## Repo-local Requirements

- Each repository or shared concrete spec that adopts this role must define:
  - mirrored automation surfaces that must stay in sync
  - tracked template families that the validation workflow must parse
  - shared configuration baselines that must remain machine-valid
