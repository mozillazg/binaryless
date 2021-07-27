# alpine

```
binaryless/debian:10
```

## 说明

与官方 `debian:10-slim` 镜像的区别如下：

* 镜像内不包含任何二进制可执行文件。
* 默认 User 是 `65534(nobody)`，镜像中只包含如下 User：
```
* uid=0(root) gid=0(root) groups=0(root)
* uid=65534(nobody) gid=65534(nogroup) groups=65534(nogroup)
```
* 自带软件包已更新到最新版本.
* 额外安装如下软件包：
```
* tzdata
* ca-certificates
```
