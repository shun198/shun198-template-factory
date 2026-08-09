from concurrent import futures

import grpc

from greeter.v1 import greeter_pb2_grpc
from template_app.config import load_settings
from template_app.service import GreeterService


def create_server(address: str) -> tuple[grpc.Server, int]:
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    greeter_pb2_grpc.add_GreeterServiceServicer_to_server(GreeterService(), server)
    port = server.add_insecure_port(address)
    if port == 0:
        raise RuntimeError(f"failed to bind gRPC server to {address}")
    return server, port


def main() -> None:
    settings = load_settings()
    server, _ = create_server(settings.grpc_address)
    server.start()
    server.wait_for_termination()


if __name__ == "__main__":
    main()
