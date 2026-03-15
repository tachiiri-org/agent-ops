# setup-provider-r2 command

## Workflow

1. Read provider-specific guidance under `providers/` when it exists for R2
2. Read `roles/adapter.md`
3. Read only the relevant shared data guidance under `data/`, especially `classification.md`, `persistence.md`, `deletion.md`, and `residency.md`
4. Read `operations/delivery.md`
5. Verify the repository directly integrates with R2 at the adapter boundary
6. Stop with an explanation if the repository does not directly integrate with R2
7. Add only the minimal R2-related scaffolding and placeholders required for the adapter boundary
8. Run the repository's standard validation commands
9. Commit the setup changes

## Constraints

- Do not apply outside repositories that directly integrate with R2
- Do not add provider values into shared guidance
- Do not use npm
