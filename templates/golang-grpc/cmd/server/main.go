package main

import (
	"log"
	"net"
	"os"

	greeterv1 "example.com/__PROJECT_SLUG__/gen/greeter/v1"
	"example.com/__PROJECT_SLUG__/internal/greeter"
	"google.golang.org/grpc"
)

func main() {
	address := os.Getenv("GRPC_ADDRESS")
	if address == "" {
		address = "127.0.0.1:50051"
	}

	listener, err := net.Listen("tcp", address)
	if err != nil {
		log.Fatalf("listen on %s: %v", address, err)
	}

	server := grpc.NewServer()
	greeterv1.RegisterGreeterServiceServer(server, greeter.Service{})

	log.Printf("gRPC server listening on %s", listener.Addr())
	if err := server.Serve(listener); err != nil {
		log.Fatalf("serve gRPC: %v", err)
	}
}
