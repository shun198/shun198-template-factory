# Decision Log

## Initial template

- Used a versioned `greeter.v1` package so API evolution has an explicit namespace.
- Kept code-generation tools pinned and installed into a repository-local `bin/` directory.
- Kept generated Go packages out of version control.
- Used `bufconn` for deterministic integration tests without external services.
- Used insecure local transport as a minimal starter; production deployments must add transport security.
