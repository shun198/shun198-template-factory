# Decision Log

## 2026-07-08

- Chose a template-factory parent repository rather than keeping starters in separate repositories during initial development.
- Standardized on `Makefile` as the primary developer interface across all templates.
- Required `README.md`, `AGENTS.md`, debug configuration, and GitHub Actions for every template to reduce onboarding friction.
- Kept local validation lightweight so the factory can validate structure without installing every ecosystem tool.
- Used placeholder-based copying rather than a full scaffolding engine to keep generation transparent and easy to maintain.

## 2026-08-09

- Added separate Python and Go gRPC starters instead of coupling both languages into one monorepo template.
- Kept educational phases and exercises out of the templates so they remain production-shaped starting points.
- Kept generated Protocol Buffer code out of version control and made setup/test commands regenerate it from `.proto` sources.
