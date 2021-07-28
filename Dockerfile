FROM golang:alpine AS golang
RUN go get -u google.golang.org/protobuf/cmd/protoc-gen-go
RUN go get -u google.golang.org/grpc/cmd/protoc-gen-go-grpc

FROM alpine:3.14
COPY --from=golang /go/bin/protoc-gen-go /usr/bin/
COPY --from=golang /go/bin/protoc-gen-go-grpc /usr/bin/
RUN apk add --no-cache protoc
ENTRYPOINT ["/usr/bin/protoc"]
