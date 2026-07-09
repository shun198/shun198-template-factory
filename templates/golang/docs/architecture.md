# Architecture

- `cmd/api/main.go` owns process startup and HTTP server wiring.
- `internal/app` contains configuration and route registration.
- The sample uses `chi` because it stays light while remaining practical for APIs.
