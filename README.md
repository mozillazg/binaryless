# Binaryless Base Images

不包含任何二进制可执行文件的容器基础镜像。


## 提供的基础镜像

目前提供如下基础镜像：

* [binaryless/alpine:3.13](./alpine/)
* [binaryless/debian:10](./debian/)

## 使用方法

使用多阶段构建方法构建业务镜像：

```dockerfile
FROM golang:1.16 AS build-env
WORKDIR /go/src/github.com/mozillazg/binaryless/example/basic
COPY . .
RUN CGO_ENABLED=0 go build -ldflags '-extldflags "-static"'

FROM binaryless/alpine:3.13
COPY --from=build-env /go/src/github.com/mozillazg/binaryless/example/basic/basic /basic
ENTRYPOINT ["/basic"]
# or
# CMD ["/basic"]
```

* 因为镜像中不包含 shell 所以 `ENTRYPOINT` 和 `CMD` 指令的值格式必须是数组不能是字符串格式。
* 更多使用方法详见 [./examples](./examples/)

## User

镜像中只包含如下 User:

* `uid=0(root)`
* `uid=65534(nobody)`

默认 User 是 `65534(nobody)` 。
如果需要使用 root 用户的话，在 Dockerfile 中使用 `USER` 指令指定即可（`USER 0`）。
