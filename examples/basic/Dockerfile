FROM golang:1.16 AS build-env
WORKDIR /go/src/github.com/mozillazg/binaryless/example/basic

COPY . .
RUN CGO=0 go build

FROM binaryless/alpine:3.13

COPY --from=build-env /go/src/github.com/mozillazg/binaryless/example/basic/basic /basic

# nobody，默认 User
# USER 65534
# root
# USER 0

ENTRYPOINT ["/basic"]
# or
# CMD ["/basic"]
