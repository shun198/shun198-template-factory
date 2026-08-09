# Architecture

- `proto/greeter/v1` is the versioned API source of truth.
- `src/greeter/v1` receives generated message and client/server binding modules.
- `src/template_app/service.py` owns RPC behavior.
- `server.py` and `client.py` are separate process entrypoints.
- tests start a real gRPC server on an ephemeral local port and exercise the public RPC contract.

Generated modules are excluded from version control. `make setup`, `make test`, and `make typecheck` regenerate them from the schema before use.
