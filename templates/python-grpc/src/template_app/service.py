import grpc

from greeter.v1 import greeter_pb2, greeter_pb2_grpc


class GreeterService(greeter_pb2_grpc.GreeterServiceServicer):
    def SayHello(
        self,
        request: greeter_pb2.SayHelloRequest,
        context: grpc.ServicerContext,
    ) -> greeter_pb2.SayHelloResponse:
        name = request.name.strip()
        if not name:
            context.abort(grpc.StatusCode.INVALID_ARGUMENT, "name is required")
        return greeter_pb2.SayHelloResponse(message=f"Hello, {name}!")
