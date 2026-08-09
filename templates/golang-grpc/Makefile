SHELL := /bin/bash
BIN_DIR := $(CURDIR)/bin
BUF := $(BIN_DIR)/buf
BUF_VERSION := v1.72.0
PROTOC_GEN_GO_VERSION := v1.36.11
PROTOC_GEN_GO_GRPC_VERSION := v1.6.2
BUF_BREAKING_AGAINST ?= .git#branch=main

.PHONY: setup tools dev proto proto-lint proto-format proto-breaking server client test lint format

setup: tools proto
	go mod tidy

tools:
	GOBIN=$(BIN_DIR) go install github.com/bufbuild/buf/cmd/buf@$(BUF_VERSION)
	GOBIN=$(BIN_DIR) go install google.golang.org/protobuf/cmd/protoc-gen-go@$(PROTOC_GEN_GO_VERSION)
	GOBIN=$(BIN_DIR) go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@$(PROTOC_GEN_GO_GRPC_VERSION)

dev: server

proto:
	mkdir -p gen
	PATH="$(BIN_DIR):$$PATH" $(BUF) generate

proto-lint:
	$(BUF) lint

proto-format:
	$(BUF) format -w

proto-breaking:
	$(BUF) breaking --against '$(BUF_BREAKING_AGAINST)'

server:
	go run ./cmd/server

client:
	go run ./cmd/client

test: proto
	go test ./...

lint:
	golangci-lint run ./...

format:
	find . -name '*.go' -not -path './gen/*' -print0 | xargs -0 gofmt -w
