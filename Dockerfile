FROM registry.cn-hangzhou.aliyuncs.com/startops-base/alpine:3.13.5

ADD dist/linux/redis_exporter /redis_exporter

CMD ["/redis_exporter"]
