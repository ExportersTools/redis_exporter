FROM golang:1.15-alpine as builder

ADD . /

RUN make

FROM alpine as alpine

COPY --from=builder /redis_exporter /redis_exporter

EXPOSE     9121

ENTRYPOINT [ "/redis_exporter" ]
