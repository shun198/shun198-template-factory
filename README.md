# template-factory

`template-factory` is the parent repository for creating, validating, and maintaining practical starter templates that can be published as GitHub Template Repositories.

## Included Templates

- `templates/terraform-google-cloud`: Terraform starter for Google Cloud environments
- `templates/python`: Python 3.14+ starter for CLI, small API, and automation use cases

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
./scripts/create-template.sh terraform-google-cloud my-gcp-stack
./scripts/create-template.sh python my-python-app
```

## What `make validate` Does

- checks shell script syntax
- validates required template files exist
- validates required `make` targets exist in each template
- validates root documentation and workflow files exist
- validates Python template generation
- runs Terraform formatting checks when Terraform is available

## Creating a Project From a Template

```bash
./scripts/create-template.sh terraform-google-cloud my-gcp-stack
./scripts/create-template.sh python my-python-app
```

The script copies the selected template into a new directory and replaces `__PROJECT_NAME__` and `__PROJECT_SLUG__`. For the Python template, it also updates the generated package path and `__PYTHON_PACKAGE__`.

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
4. If you changed Terraform files, also run template-level Terraform checks where available.

See `docs/architecture.md`, `docs/template-policy.md`, `AGENTS.md`, and `CLAUDE.md` for repository rules.
