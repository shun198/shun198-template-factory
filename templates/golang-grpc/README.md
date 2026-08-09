# __PROJECT_NAME__

Go 1.25+ starter for Protocol Buffers and gRPC services.

## Features

- Go 1.25.10+
- `cmd/server` and `cmd/client` entrypoints
- Buf schema lint, format, generation, and breaking-change checks
- pinned local code-generation tools
- generated Go packages kept out of version control
- in-memory `bufconn` integration tests
- `golangci-lint`, Docker, and VS Code debug configuration

## Requirements

- Go 1.25.10+
- `golangci-lint` for local linting

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
```

`make proto-breaking` compares the current schema with `main`. Override `BUF_BREAKING_AGAINST` when the base branch or remote differs.

## Layout

```text
proto/greeter/v1/       Protocol Buffer source of truth
gen/greeter/v1/         generated Go packages
cmd/server/             server process
cmd/client/             client process
internal/greeter/       RPC implementation
tests/                  in-memory transport tests
```

Edit `.proto` files and run `make proto`; never edit generated Go files directly.
