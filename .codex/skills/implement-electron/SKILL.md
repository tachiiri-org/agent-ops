---
name: implement-electron
description: Plan and implement Electron changes with formatting, typecheck, lint, tests, and build verification.
---

# implement-electron skill

## Goals

- Restate the goal, affected surface, and relevant domain and profile constraints from onboarding
- Reconstruct missing onboarding profile context before editing if the current task did not enter through onboarding
- Plan the minimal change set before editing
- Define expected behavior before coding
- Write or update tests first when behavior changes or a bug is being fixed
- Implement the minimal change needed to satisfy the tests
- Refactor only after behavior is covered
- Run scoped checks first when possible
- Format by `bun run prettier`
- Typecheck by `bun run tsc --noEmit`
- Lint by `bun run lint`
- Unit test by `bun run test`
- Build check by `bun run build`
- Run a UI smoke check when Electron UI behavior changed
- Run scripted visual or UI checks only if the repository already provides them
- Summarize changed behavior, touched surfaces, and verification results

## Constraints

- treat onboarding context as required input
- require `profiles/runtime/electron.md` when the repository adopts the Electron runtime profile
- require `profiles/identity/auth0.md` when the repository directly integrates with Auth0
- if onboarding context is missing, recover the minimum role, domain, and profile context before changing code
- use tests-first by default for behavioral changes
- if the change is purely mechanical and behavior-preserving, tests-first is optional but validation is still required
- do not create pr
