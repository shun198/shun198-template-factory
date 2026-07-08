SHELL := /bin/bash
PNPM ?= pnpm

.PHONY: setup dev test lint format

setup:
	$(PNPM) install

dev:
	$(PNPM) run dev

test:
	$(PNPM) run test

lint:
	$(PNPM) run lint

format:
	$(PNPM) exec prettier --write .
