SHELL := /bin/bash

.PHONY: help validate validate-shell validate-templates

help:
	@echo "Available targets:"
	@echo "  make validate          Validate repository structure and template requirements"

validate: validate-shell validate-templates

validate-shell:
	@bash -n scripts/create-template.sh
	@bash -n scripts/validate-template.sh

validate-templates:
	@./scripts/validate-template.sh
