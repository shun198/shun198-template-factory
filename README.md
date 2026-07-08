# template-factory

`template-factory` is the parent repository for creating, validating, and maintaining practical starter templates that can be published as GitHub Template Repositories.

## Included Templates

- `templates/python`: Python 3.14+ starter for CLI, small API, and automation use cases
- `templates/golang`: Go 1.25+ starter for CLI, HTTP API, and batch jobs

## Repository Layout

```text
template-factory/
  README.md
  AGENTS.md
  CLAUDE.md
  Makefile
  docs/
  templates/
  scripts/
  .github/workflows/ci.yml
```

## Quick Start

```bash
make validate
./scripts/create-template.sh python my-python-app
```

## What `make validate` Does

- checks shell script syntax
- validates required template files exist
- validates required `make` targets exist in each template
- validates root documentation and workflow files exist

## Creating a Project From a Template

```bash
./scripts/create-template.sh python my-python-app
./scripts/create-template.sh golang my-go-service
```

The script copies a template into a new directory and replaces placeholders such as `__PROJECT_NAME__`, `__PROJECT_SLUG__`, and `__PYTHON_PACKAGE__`.

## Design Principles

- practical defaults over framework sprawl
- minimal structure that is still production-shaped
- every template must be usable by reading only its `README.md`
- AI agents must be able to understand and safely modify each template
- documentation, debug config, and CI must stay aligned with implementation

## Maintenance Flow

1. Update the relevant template under `templates/`.
2. Keep `README.md`, `AGENTS.md`, `CLAUDE.md`, `Makefile`, `.vscode/launch.json`, and `.github/workflows/ci.yml` aligned.
3. Run `make validate`.

See [docs/architecture.md](/Users/shunichihirose/repo/shun198-template-factory/docs/architecture.md), [docs/template-policy.md](/Users/shunichihirose/repo/shun198-template-factory/docs/template-policy.md), [AGENTS.md](/Users/shunichihirose/repo/shun198-template-factory/AGENTS.md), and [CLAUDE.md](/Users/shunichihirose/repo/shun198-template-factory/CLAUDE.md) for repository rules.
