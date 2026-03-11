---
name: setup-tool-bun
description: Ensure Bun package management and baseline Bun scripts are configured for Bun-managed repositories.
---

# setup-tool-bun command

## Workflow

1. Verify the repository is intended to use Bun
2. Inspect Bun-related state as `present`, `missing`, or `drifted`
3. Ensure `package.json` exists
4. Ensure Bun is the package manager entrypoint for install and script execution
5. Ensure repository scripts assume `bun run` rather than npm
6. Report the final Bun setup status so the consuming role command can summarize reconciliation

## Constraints

- Do not add runtime-specific assumptions
- Do not use npm
- Treat this command as an internal setup module that may be called repeatedly
