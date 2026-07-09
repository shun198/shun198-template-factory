# __PROJECT_NAME__

Go 1.25+ starter for CLI, HTTP APIs, and batch jobs.

## Features

- Go 1.25+
- standard library first
- `chi` router for lightweight HTTP routing
- `golangci-lint`
- `cmd/` and `internal/` layout
- `.env.example`
- `Dockerfile`
- `docker-compose.yml`

## Requirements

- Go 1.25+
- `golangci-lint` for local linting

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
```

## Layout

```text
cmd/api/
internal/app/
tests/
```

## Notes

- `make dev` runs a tiny HTTP server with a health endpoint.
- Keep `internal/` for application code you do not want imported by downstream modules.
