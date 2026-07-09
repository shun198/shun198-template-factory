# __PROJECT_NAME__

Terraform starter for Google Cloud personal projects, small production workloads, and sandbox environments.

## Features

- Terraform with Google Cloud provider
- `envs/dev` and `envs/prod`
- shared module for a minimal Cloud Storage sample
- variables and outputs
- backend configuration samples
- IAM least-privilege guidance
- `terraform fmt`, `terraform validate`, and `trivy` linting hooks

## Requirements

- Terraform 1.9+
- Google Cloud credentials configured locally
- `trivy` for local IaC linting

## Getting Started

```bash
cp envs/dev/terraform.tfvars.example envs/dev/terraform.tfvars
cp envs/dev/backend.hcl.example envs/dev/backend.hcl
make init
make plan
```

- Run commands from the template root.
- `make init` uses `backend.hcl` when present and falls back to `-backend=false` for local-first onboarding.
- To target another environment, pass `TF_DIR=envs/prod`.

## Commands

```bash
make init
make plan
make apply
make destroy
make fmt
make validate
make lint
```

## Layout

```text
envs/
  dev/
  prod/
modules/
  storage_bucket/
tests/
```

## Notes

- The sample provisions a versioned Cloud Storage bucket.
- Bucket names include `project_id` by default to reduce collisions across projects and users.
- Keep backend config values out of version control.
- Start with `make TF_DIR=envs/dev plan` and promote only after reviewing variable differences.
