# __PROJECT_NAME__

Python 3.14+ starter for CLI tools, small APIs, and automation scripts.

## Features

- `uv` for dependency and virtual environment management
- `ruff` for lint and format
- `pytest` for tests
- `mypy` for type checks
- `src/` layout
- `typer` CLI entrypoint
- structured logging
- `.env.example`
- `Dockerfile`
- `docker-compose.yml`

## Requirements

- Python 3.14+
- `uv`

## Getting Started

```bash
cp .env.example .env
make setup
make dev
```

## Commands

```bash
make setup
make dev
make test
make lint
make format
make typecheck
```

## Project Layout

```text
src/__PYTHON_PACKAGE__/
  cli.py
  config.py
  logging_config.py
tests/
```

## Notes

- `make dev` starts the sample CLI entrypoint in local development mode.
- Replace the sample command handlers with your own domain logic.
- If you want an API instead of a CLI, keep the same support modules and swap the entrypoint.
