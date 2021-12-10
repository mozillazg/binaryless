FROM debian:10.10-slim
RUN apt-get update && apt-get upgrade -y && rm -rf /var/cache/apt/ && \
    apt-get install --no-install-recommends -y tzdata ca-certificates && update-ca-certificates && \
    echo -e "root:x:0:0:root:/root:/bin/bash\nnobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin" | tee /etc/passwd && \
    echo -e "root:x:0:root\nnogroup:x:65534:" | tee /etc/group && \
    cp /bin/rm /rm_bak && \
    /rm_bak -rf /usr/lib/dpkg/info/bash.preinst && \
    /rm_bak -rf /usr/lib/apt/apt-helper && \
    /rm_bak -rf /usr/lib/apt/methods/* && \
    /rm_bak -rf /usr/local/sbin/* && \
    /rm_bak -rf /usr/local/bin/* && \
    /rm_bak -rf /usr/sbin/* && \
    /rm_bak -rf /usr/bin/* && \
    /rm_bak -rf /sbin/* && \
    /rm_bak -rf /bin/* && \
    /rm_bak -rf /rm_bak

USER 65534
