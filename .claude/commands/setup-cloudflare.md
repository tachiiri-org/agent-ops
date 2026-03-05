# setup-cloudflare command

## Goals

1. Run `bootstrap-node.sh [TARGET_REPO_PATH]`
2. Read CLAUDE.md
3. Verify working tree is clean
4. Create a new branch and switch to it
5. Verify auth status of wrangler
6. Verify auth status of GitHub
7. Verify availability of Codex via MCP
8. Verify availability of Serena via MCP; if unavailable output configuration instructions and stop; if available call `activate_project` with the current repository path
9. Call `activate_project` of Serena with the current repository path

## Memo

`bootstrap-node.sh [TARGET_REPO_PATH]`performs:

- Git fetch on the current branch
- Copies `package.template.json` if `package.json` is missing, then runs `bun init -y`
- Runs `bun install`
- Adds devDependencies: `prettier`, `eslint`, `typescript`, `vitest`, `@playwright/test`
- Adds `github:tachiiri-org/cloude-ops` package

## Constraints

- Don't read application/source code files
- Don't start development work
- Don't use npm
