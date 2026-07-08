# Architecture

## Goal

This repository separates template maintenance concerns from the generated repositories themselves.

## Layers

- root layer: governance, validation scripts, and CI for the factory
- template layer: independently usable starter repositories
- generation layer: copy and placeholder replacement via `scripts/create-template.sh`

## Template Shape

Every template is expected to include:

- onboarding documentation
- AI agent guidance
- a developer-oriented `Makefile`
- debug configuration for VS Code or Cursor
- GitHub Actions CI
- minimal sample code and tests

## Validation Strategy

The factory intentionally performs cheap structural validation locally:

- shell syntax checks
- required file presence checks
- required `make` target checks
- optional Terraform formatting and validation checks when tooling exists

Language-specific dependency installs are delegated to each template's own CI workflow so each starter remains independently verifiable.
