FROM golang:1.22-alpine AS builder
WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -o subscriber main.go

FROM alpine:3.22
WORKDIR /app
COPY --from=builder /app/subscriber .

# Ensure the binary is executable
RUN chmod +x /app/subscriber

CMD ["/app/subscriber"]