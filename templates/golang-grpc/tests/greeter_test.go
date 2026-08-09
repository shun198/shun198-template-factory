package tests

import (
	"context"
	"errors"
	"net"
	"testing"
	"time"

	greeterv1 "example.com/__PROJECT_SLUG__/gen/greeter/v1"
	"example.com/__PROJECT_SLUG__/internal/greeter"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/credentials/insecure"
	"google.golang.org/grpc/status"
	"google.golang.org/grpc/test/bufconn"
)

func newClient(t *testing.T) greeterv1.GreeterServiceClient {
	t.Helper()

	listener := bufconn.Listen(1024 * 1024)
	server := grpc.NewServer()
	greeterv1.RegisterGreeterServiceServer(server, greeter.Service{})
	serveErrors := make(chan error, 1)
	go func() {
		serveErrors <- server.Serve(listener)
	}()
	t.Cleanup(func() {
		server.Stop()
		if err := <-serveErrors; err != nil && !errors.Is(err, grpc.ErrServerStopped) {
			t.Errorf("serve gRPC: %v", err)
		}
	})

	connection, err := grpc.NewClient(
		"passthrough:///bufconn",
		grpc.WithContextDialer(func(context.Context, string) (net.Conn, error) {
			return listener.Dial()
		}),
		grpc.WithTransportCredentials(insecure.NewCredentials()),
	)
	if err != nil {
		t.Fatalf("create gRPC client: %v", err)
	}
	t.Cleanup(func() { _ = connection.Close() })

	return greeterv1.NewGreeterServiceClient(connection)
}

func TestSayHello(t *testing.T) {
	for _, testCase := range []struct {
		name  string
		input string
	}{
		{name: "plain", input: "Ada"},
		{name: "surrounding whitespace", input: "  Ada  "},
	} {
		t.Run(testCase.name, func(t *testing.T) {
			ctx, cancel := context.WithTimeout(t.Context(), time.Second)
			defer cancel()

			response, err := newClient(t).SayHello(
				ctx,
				&greeterv1.SayHelloRequest{Name: testCase.input},
			)
			if err != nil {
				t.Fatalf("SayHello returned an error: %v", err)
			}
			if response.GetMessage() != "Hello, Ada!" {
				t.Fatalf("unexpected message: %q", response.GetMessage())
			}
		})
	}
}

func TestSayHelloRejectsBlankName(t *testing.T) {
	ctx, cancel := context.WithTimeout(t.Context(), time.Second)
	defer cancel()

	_, err := newClient(t).SayHello(
		ctx,
		&greeterv1.SayHelloRequest{Name: "  "},
	)
	if status.Code(err) != codes.InvalidArgument {
		t.Fatalf("unexpected status: %v", status.Code(err))
	}
}
