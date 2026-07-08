# Decision Log

## Initial Choices

- Used `chi` for a lightweight router.
- Chose `cmd/` and `internal/` so the same structure fits API, CLI, and batch jobs.
- Kept the sample to a single health endpoint to stay easy to replace.
