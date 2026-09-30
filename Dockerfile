# Build stage
FROM golang:1.27-alpine AS builder

WORKDIR /app

COPY go.mod ./
COPY main.go ./
COPY main_test.go ./

ARG VERSION=dev

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
    go build -ldflags="-s -w -X main.version=${VERSION}" \
    -o app .

# Runtime stage
FROM alpine:3.22

WORKDIR /app

COPY --from=builder /app/app .

ENV PORT=8080

EXPOSE 8080

CMD ["./app"]