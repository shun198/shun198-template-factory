FROM golang:1.25 AS build

WORKDIR /src
COPY . .
RUN make setup && CGO_ENABLED=0 go build -o /out/grpc-server ./cmd/server

FROM gcr.io/distroless/static-debian12:nonroot
COPY --from=build /out/grpc-server /grpc-server

EXPOSE 50051

ENTRYPOINT ["/grpc-server"]
