SHELL := /bin/bash

.PHONY: setup dev test lint format

setup:
	go mod tidy

dev:
	go run ./cmd/api

test:
	go test ./...

lint:
	golangci-lint run ./...

format:
	find . -name '*.go' -print0 | xargs -0 gofmt -w
