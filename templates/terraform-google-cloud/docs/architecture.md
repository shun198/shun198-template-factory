# Architecture

- `envs/dev` and `envs/prod` are thin root modules with environment-specific variables.
- `modules/storage_bucket` contains the minimal reusable sample infrastructure.
- The sample uses Cloud Storage because it is lightweight and easy to understand for first-day Terraform users.
