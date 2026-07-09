from __future__ import annotations

import os
from dataclasses import dataclass


@dataclass(frozen=True)
class Settings:
    app_name: str
    app_env: str
    log_level: str
    host: str
    port: int


def load_settings() -> Settings:
    return Settings(
        app_name=os.getenv("APP_NAME", "__PROJECT_NAME__"),
        app_env=os.getenv("APP_ENV", "development"),
        log_level=os.getenv("APP_LOG_LEVEL", "INFO"),
        host=os.getenv("APP_HOST", "0.0.0.0"),
        port=int(os.getenv("APP_PORT", "8000")),
    )
