# setup-role-bff command

## Purpose

- Preferred role-bundle name for BFF repository setup under the `setup-<axis>-<name>` taxonomy.
- Owns BFF-specific scaffold and responsibility boundaries.
- Composes with runtime and optional identity modules instead of embedding those concerns into the command name.

## Tool Modules

- Required:
  - `setup-tool-bun`
  - `setup-tool-typescript`
  - `setup-tool-eslint`
  - `setup-tool-prettier`
  - `setup-tool-vitest`

## Workflow

1. Run the repository bootstrap flow for the target path
2. Read `CLAUDE.md`
3. Read `principles/core.md`
4. Read `profiles/core.md`
5. Read `principles/roles/bff.md`
6. Verify working tree is clean
7. Ensure `main` and `dev` branch setup exists and switch to a feature branch
8. Verify GitHub auth status
9. Verify Codex and Serena availability
10. Activate the project in Serena
11. Apply the BFF baseline scaffold only:
   - a minimal health endpoint
   - a minimal internal-boundary entrypoint
   - no application features beyond scaffold
12. Apply the tool modules listed above
13. Require composition with:
   - `setup-runtime-cloudflare-workers` when the BFF runs on Workers
14. Optionally compose with:
   - `setup-idp-auth0` when the BFF directly integrates with Auth0
15. Run the repository's standard validation commands
16. Commit the scaffold
17. Create a pull request targeting `dev`

## Constraints

- Do not embed runtime-specific assumptions into this role command
- Do not embed provider-specific integration setup into this role command
- Do not implement application behavior beyond a minimal BFF scaffold
- Do not use npm
