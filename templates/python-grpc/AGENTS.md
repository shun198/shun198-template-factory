# AGENTS.md

## Template purpose

This template is a practical Python starter for Protocol Buffers and gRPC services.

## Rules

- Keep `.proto` files under `proto/` as the API source of truth.
- Never edit generated `*_pb2.py`, `*_pb2.pyi`, or `*_pb2_grpc.py` files directly.
- Run `make proto` after schema changes.
- Preserve field numbers and reserve removed fields before reusing names or numbers.
- Keep the `src/` layout and typed Python code.
- Keep deadlines on client calls and map expected failures to gRPC status codes.
- Keep README, Makefile, debug settings, and CI commands aligned.
- Maintain passing `ruff`, `mypy`, `pytest`, Buf lint, and breaking-change checks.
