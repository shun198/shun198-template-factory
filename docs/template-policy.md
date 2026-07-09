# Template Policy

## Required Outcomes

Each template must:

- be understandable from `README.md` alone
- provide the documented `make` commands
- include a minimal but realistic sample implementation
- include at least one minimal test
- include agent-facing instructions in `AGENTS.md`
- include Claude-facing instructions in `CLAUDE.md`
- remain easy to extend without major refactoring

## Practical Scope

- prefer standard library and ecosystem defaults where possible
- include only the minimum tooling needed for good day-one quality
- keep configuration explicit and readable
- prefer directory structures that scale from small to medium projects

## Drift Prevention

Any change to commands, entrypoints, or workflow behavior must update:

- `README.md`
- `AGENTS.md`
- `CLAUDE.md`
- `Makefile`
- `.vscode/launch.json`
- `.github/workflows/ci.yml`

## Placeholder Policy

Templates may include these placeholders:

- `__PROJECT_NAME__`
- `__PROJECT_SLUG__`
- `__PYTHON_PACKAGE__`

Do not introduce new placeholders unless `scripts/create-template.sh` is updated accordingly.
