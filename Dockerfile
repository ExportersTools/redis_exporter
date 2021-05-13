FROM golang:1.15-alpine as builder

WORKDIR /opt/

ADD . /opt/

RUN go env -w GOPROXY=https://goproxy.cn,direct

RUN go build -o /redis_exporter main.go

FROM alpine as alpine

COPY --from=builder /redis_exporter /redis_exporter

EXPOSE 9121

ENTRYPOINT ["/redis_exporter"]