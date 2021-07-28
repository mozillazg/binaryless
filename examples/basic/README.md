# basic

镜像基本用法，详见 Dockerfile 。

## build

```
$ docker build -t binaryless/basic-alpine -f alpine.Dockerfile .
$ docker run --rm binaryless/basic-alpine
Hello!

$ docker build -t binaryless/basic-debian -f debian.Dockerfile .
$ docker run --rm binaryless/basic-debian
Hello!
```
