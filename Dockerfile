FROM golang:1.19-alpine

WORKDIR /app
RUN mkdir -p /app/internal/alert
RUN mkdir -p /app/internal/node
# Download necessary Go modules
COPY go.mod /app/.
COPY go.sum /app/.
RUN go mod download
COPY *.go /app/.
COPY ./internal/alert/*.go /app/internal/alert/.
COPY ./internal/node/*.go /app/internal/node/.
RUN go build
ENTRYPOINT ["/bin/sh"]
