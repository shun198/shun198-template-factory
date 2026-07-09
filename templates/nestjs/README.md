# **PROJECT_NAME**

NestJS starter for backend APIs, admin APIs, and internal tool APIs.

## Features

- TypeScript
- NestJS
- `pnpm`
- ESLint
- Prettier
- Jest
- config module
- health check endpoint
- `.env.example`
- `Dockerfile`
- `docker-compose.yml`

## Requirements

- Node.js 22+
- `pnpm` 9+

## Getting Started

```bash
cp .env.example .env
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
src/
  app.module.ts
  config/
  health/
tests/
```

## Notes

- `make dev` runs Nest in watch mode.
- The sample app exposes `GET /health`.
- Add feature modules under `src/` as your API surface grows.
