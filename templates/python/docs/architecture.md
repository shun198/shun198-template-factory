# Architecture

- `src/__PYTHON_PACKAGE__/cli.py` is the entrypoint.
- `config.py` centralizes environment-driven settings.
- `logging_config.py` keeps logging initialization separate from command code.
- This split works for CLI, API, and automation use cases without forcing a framework-heavy structure.
