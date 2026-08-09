from collections.abc import Iterator

import grpc
import pytest

from template_app.client import greet
from template_app.server import create_server


@pytest.fixture
def server_address() -> Iterator[str]:
    server, port = create_server("127.0.0.1:0")
    server.start()
    try:
        yield f"127.0.0.1:{port}"
    finally:
        server.stop(grace=None).wait()


def test_greet_returns_message(server_address: str) -> None:
    assert greet(server_address, "Ada") == "Hello, Ada!"
    assert greet(server_address, "  Ada  ") == "Hello, Ada!"


def test_greet_rejects_blank_name(server_address: str) -> None:
    with pytest.raises(grpc.RpcError) as error:
        greet(server_address, "  ")

    assert error.value.code() is grpc.StatusCode.INVALID_ARGUMENT
