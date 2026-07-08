# __PROJECT_NAME__

Next.js App Router starter for SaaS frontends, dashboards, and internal admin tools.

## Features

- TypeScript
- Next.js App Router
- `pnpm`
- ESLint
- Prettier
- Vitest
- Testing Library
- sample layout and page
- `.env.example`
- `Dockerfile`

## Requirements

- Node.js 22+
- `pnpm` 9+

## Getting Started

```bash
cp .env.example .env.local
make setup
make dev
```

## Commands

```bash
make setup
make dev
make test
make lint
make format
```

## Layout

```text
app/
components/
tests/
```

## Notes

- The starter uses the App Router and a small sample dashboard landing page.
- Playwright is intentionally left out by default to keep the baseline light.
