import grpc

from greeter.v1 import greeter_pb2, greeter_pb2_grpc
from template_app.config import load_settings


def greet(address: str, name: str, timeout: float = 5.0) -> str:
    with grpc.insecure_channel(address) as channel:
        stub = greeter_pb2_grpc.GreeterServiceStub(channel)
        response: greeter_pb2.SayHelloResponse = stub.SayHello(
            greeter_pb2.SayHelloRequest(name=name), timeout=timeout
        )
    return response.message


def main() -> None:
    settings = load_settings()
    print(greet(settings.grpc_address, "gRPC"))


if __name__ == "__main__":
    main()
