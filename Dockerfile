from golang:alpine AS builder
WORKDIR /go/bin
RUN go clean
COPY exec.go /go/bin
RUN go build -ldflags '-w'

FROM scratch
COPY --from=builder /go/bin .
CMD ["./bin"]
