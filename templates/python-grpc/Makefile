SHELL := /bin/bash
UV ?= uv
BUF_BREAKING_AGAINST ?= .git#branch=main

.PHONY: setup dev proto proto-lint proto-format proto-breaking server client test lint format typecheck

setup:
	$(UV) sync --all-extras
	$(MAKE) proto

dev: server

proto:
	UV=$(UV) bash scripts/generate-proto.sh

proto-lint:
	buf lint

proto-format:
	buf format -w

proto-breaking:
	buf breaking --against '$(BUF_BREAKING_AGAINST)'

server:
	$(UV) run python -m template_app.server

client:
	$(UV) run python -m template_app.client

test: proto
	$(UV) run pytest

lint:
	$(UV) run ruff check .

format:
	$(UV) run ruff format .

typecheck: proto
	$(UV) run mypy src/template_app
