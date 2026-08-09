# Architecture

- `proto/greeter/v1` is the versioned API source of truth.
- `gen/greeter/v1` receives generated message and client/server bindings.
- `internal/greeter` owns RPC behavior.
- `cmd/server` and `cmd/client` are separate process entrypoints.
- tests use `bufconn` to exercise serialization and the gRPC transport without opening a network port.

Generated Go packages are excluded from version control. `make setup` and `make test` regenerate them from the schema before use.
