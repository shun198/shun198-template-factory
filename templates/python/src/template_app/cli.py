from __future__ import annotations

import logging

import typer

from .config import load_settings
from .logging_config import configure_logging

app = typer.Typer(help="Starter CLI for __PROJECT_NAME__.")
logger = logging.getLogger(__name__)


@app.command("run-server")
def run_server() -> None:
    settings = load_settings()
    configure_logging(settings.log_level)
    logger.info(
        "sample service booting",
        extra={
            "app_name": settings.app_name,
            "environment": settings.app_env,
            "host": settings.host,
            "port": settings.port,
        },
    )
    typer.echo(f"{settings.app_name} listening on http://{settings.host}:{settings.port}")


if __name__ == "__main__":
    app()
