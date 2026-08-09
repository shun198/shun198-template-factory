package greeter

import (
	"context"
	"strings"

	greeterv1 "example.com/__PROJECT_SLUG__/gen/greeter/v1"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

type Service struct {
	greeterv1.UnimplementedGreeterServiceServer
}

func (Service) SayHello(_ context.Context, request *greeterv1.SayHelloRequest) (*greeterv1.SayHelloResponse, error) {
	name := strings.TrimSpace(request.GetName())
	if name == "" {
		return nil, status.Error(codes.InvalidArgument, "name is required")
	}

	return &greeterv1.SayHelloResponse{Message: "Hello, " + name + "!"}, nil
}
