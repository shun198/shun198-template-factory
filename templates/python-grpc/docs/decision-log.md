# Decision Log

## Initial template

- Used a versioned `greeter.v1` package so API evolution has an explicit namespace.
- Kept generated modules outside the application package and out of version control.
- Used a local ephemeral port in tests to cover serialization and transport without external services.
- Used insecure local transport as a minimal starter; production deployments must add transport security.
