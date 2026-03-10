# deploy-ts command

## Steps

1. Read `principles/domains/ops-governance.md`
2. Read `principles/domains/compatibility-and-change.md`
3. Read `profiles/runtime/cloudflare-workers.md`
4. Read the matching role document when the repository role is BFF, gateway, or adapter
5. Verify the current branch is not `main`
6. Run `npx wrangler whoami` to confirm Cloudflare auth
7. Run `bun run deploy:dev` to deploy to staging
8. Output the deployed worker URL

## Constraints

- Don't deploy from the main branch
- Don't use wrangler directly; use `bun run deploy:dev` only
- Don't deploy to production; staging only
