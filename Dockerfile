FROM golang:alpine AS golang
RUN go get github.com/golang/protobuf/protoc-gen-go

FROM alpine:3.14
COPY --from=golang /go/bin/protoc-gen-go /usr/bin/
RUN apk add --no-cache protoc
