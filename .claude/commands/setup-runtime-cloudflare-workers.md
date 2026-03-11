# setup-runtime-cloudflare-workers command

## Purpose

- Preferred runtime-module name for Workers setup under the `setup-<axis>-<name>` taxonomy.
- Owns Workers-specific bootstrap and baseline runtime tooling.
- Composes with role bundles such as BFF, gateway, and adapter.

## Workflow

1. Read `profiles/runtime/cloudflare-workers.md`
2. Verify the repository is intended to run on Cloudflare Workers
3. Inspect Workers runtime state as `present`, `missing`, or `drifted`
4. Read `tooling/recommended-versions.json` for the stored `wrangler` baseline when reconciling runtime dependencies
5. Run `.claude/scripts/bootstrap-worker.sh [TARGET_REPO_PATH]` only when required runtime files or scripts are missing or drifted
6. Ensure baseline tooling and Worker runtime dependencies are present
7. Ensure `package.json` exposes `bun run deploy:preview` and `bun run deploy:staging` for Worker preview and staging deploys
8. Ensure `scripts/deploy-preview.sh` and `scripts/deploy-staging.sh` exist and own the Worker-specific deploy commands
9. Ensure `scripts/github/upsert-pr-comment.py` exists for CI URL reporting
10. Ensure `.github/workflows/preview-pr.yml` exists and deploys preview on `pull_request` to `dev`
11. Ensure `.github/workflows/deploy-staging.yml` exists and deploys on `push` to `dev`
12. Ensure `.github/workflows/release-pr.yml` exists and maintains the release PR on `push` to `dev`
13. Report the final runtime setup status so the consuming role command can summarize reconciliation
14. Keep Cloudflare-native service selection explicit rather than implied by Workers adoption
15. Run the repository's standard validation commands

## Composes With

- `setup-role-bff`
- `setup-role-gateway`
- `setup-role-adapter`

## Constraints

- Do not embed BFF-, gateway-, or adapter-specific behavior into this runtime command
- Do not imply adoption of D1, KV, R2, Queues, Durable Objects, or Workflows by Workers setup alone
- Do not move staging deploy execution into the `pr` workflow
- Do not use npm
- Treat this command as an internal setup module that may be called repeatedly
