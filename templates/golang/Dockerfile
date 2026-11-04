FROM golang:1.27 AS builder

WORKDIR /app
COPY . .

RUN go build -o /bin/app ./cmd/api

FROM gcr.io/distroless/base-debian12

COPY --from=builder /bin/app /app

EXPOSE 8080

ENTRYPOINT ["/app"]
