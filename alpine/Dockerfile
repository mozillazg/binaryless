FROM alpine:3.13
RUN apk update && apk upgrade && apk add --no-cache tzdata ca-certificates && update-ca-certificates && \
    rm -rf /usr/local/sbin/* && \
    rm -rf /usr/local/bin/* && \
    rm -rf /usr/sbin/* && \
    rm -rf /usr/bin/* && \
    rm -rf /sbin/* && \
    rm -rf /bin/*
