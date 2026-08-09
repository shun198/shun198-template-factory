package main

import (
	"context"
	"fmt"
	"log"
	"os"
	"time"

	greeterv1 "example.com/__PROJECT_SLUG__/gen/greeter/v1"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
)

func main() {
	address := os.Getenv("GRPC_ADDRESS")
	if address == "" {
		address = "127.0.0.1:50051"
	}

	connection, err := grpc.NewClient(address, grpc.WithTransportCredentials(insecure.NewCredentials()))
	if err != nil {
		log.Fatalf("create gRPC client: %v", err)
	}
	defer func() {
		if err := connection.Close(); err != nil {
			log.Printf("close gRPC connection: %v", err)
		}
	}()

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()

	response, err := greeterv1.NewGreeterServiceClient(connection).SayHello(
		ctx,
		&greeterv1.SayHelloRequest{Name: "gRPC"},
	)
	if err != nil {
		log.Fatalf("say hello: %v", err)
	}

	fmt.Println(response.GetMessage())
}
