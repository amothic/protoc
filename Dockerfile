FROM golang:alpine AS golang
RUN go get -u google.golang.org/protobuf/cmd/protoc-gen-go
RUN go get -u google.golang.org/grpc/cmd/protoc-gen-go-grpc

FROM node:alpine
COPY --from=golang /go/bin/protoc-gen-go /usr/bin/
COPY --from=golang /go/bin/protoc-gen-go-grpc /usr/bin/
RUN set -ex \
    && apk add --no-cache protoc protobuf-dev \
    && npm install -g ts-protoc-gen
ENTRYPOINT ["/usr/bin/protoc"]
