import os
from dataclasses import dataclass


@dataclass(frozen=True)
class Settings:
    grpc_address: str


def load_settings() -> Settings:
    return Settings(grpc_address=os.getenv("GRPC_ADDRESS", "127.0.0.1:50051"))
