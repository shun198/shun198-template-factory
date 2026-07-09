SHELL := /bin/bash
UV ?= uv

.PHONY: setup dev test lint format typecheck

setup:
	$(UV) sync --all-extras

dev:
	$(UV) run python -m template_app.cli run-server

test:
	$(UV) run pytest

lint:
	$(UV) run ruff check .

format:
	$(UV) run ruff format .

typecheck:
	$(UV) run mypy src
