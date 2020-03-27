From registry.cn-hangzhou.aliyuncs.com/latelee/busybox-amd64

LABEL maintainer="Late Lee"

COPY webgin /

EXPOSE 80

CMD ["/webgin"]
