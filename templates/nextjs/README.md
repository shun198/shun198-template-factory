# **PROJECT_NAME**

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

- Node.js 24 LTS
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
make build
```

## Docker

`NEXT_PUBLIC_APP_NAME` is compiled into the static page at build time. Pass it
as a build argument when creating the image:

```bash
docker build \
  --build-arg NEXT_PUBLIC_APP_NAME="**PROJECT_NAME**" \
  --tag __PROJECT_SLUG__:local \
  .
docker run --rm --publish 3000:3000 __PROJECT_SLUG__:local
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
