FROM python:3.14-slim

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir uv && uv sync --all-extras

CMD ["uv", "run", "python", "-m", "template_app.cli", "run-server"]
