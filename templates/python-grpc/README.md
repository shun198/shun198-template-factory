# __PROJECT_NAME__

Python 3.14+ starter for Protocol Buffers and gRPC services.

## Features

- `uv` for dependency and virtual environment management
- `grpcio` and `grpcio-tools`
- Buf lint and breaking-change configuration
- generated Python modules kept out of version control
- unary server and client entrypoints
- `pytest`, `ruff`, and `mypy`
- Docker and VS Code debug configuration

## Requirements

- Python 3.14+
- `uv`
- Buf CLI for `make proto-lint`, `make proto-format`, and `make proto-breaking`

## Getting Started

```bash
cp .env.example .env
make setup
make server
```

In another terminal:

```bash
make client
```

## Commands

```bash
make setup
make proto
make proto-lint
make proto-format
make proto-breaking
make server
make client
make test
make lint
make format
make typecheck
```

`make proto-breaking` compares the current schema with `main`. Override `BUF_BREAKING_AGAINST` when the base branch or remote differs.

## Layout

```text
proto/greeter/v1/       Protocol Buffer source of truth
src/greeter/v1/         generated Python modules
src/template_app/       service and client implementation
tests/                  in-process gRPC tests
```

Edit `.proto` files and run `make proto`; never edit generated modules directly.
