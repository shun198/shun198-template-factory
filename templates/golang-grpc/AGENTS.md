# AGENTS.md

## Template purpose

This template is a practical Go starter for Protocol Buffers and gRPC services.

## Rules

- Keep `.proto` files under `proto/` as the API source of truth.
- Never edit generated `.pb.go` files directly.
- Run `make proto` after schema changes.
- Preserve field numbers and reserve removed fields before reusing names or numbers.
- Keep process entrypoints under `cmd/` and service logic under `internal/`.
- Return contextual errors and map expected failures to gRPC status codes.
- Keep deadlines on client calls.
- Keep README, Makefile, debug settings, and CI commands aligned.
- Maintain passing Go tests, format, golangci-lint, Buf lint, and breaking-change checks.
