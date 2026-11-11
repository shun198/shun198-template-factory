FROM python:3.15-slim

WORKDIR /app

COPY --from=ghcr.io/astral-sh/uv:0.11.28 /uv /uvx /bin/
COPY . .

RUN uv sync --locked && bash scripts/generate-proto.sh && uv sync --locked --no-dev

EXPOSE 50051

CMD ["uv", "run", "--no-sync", "python", "-m", "template_app.server"]
