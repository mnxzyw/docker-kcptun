FROM golang:1.14.4-alpine3.12 as builder

ENV GO111MODULE=on
RUN apk update && \
    apk upgrade && \
    apk add git gcc libc-dev linux-headers
RUN go get -ldflags "-X main.VERSION=$(date -u +%Y%m%d) -s -w" github.com/xtaci/kcptun/client && go get -ldflags "-X main.VERSION=$(date -u +%Y%m%d) -s -w" github.com/xtaci/kcptun/server

FROM alpine:3.12.0
RUN apk add --no-cache iptables
COPY --from=builder /go/bin /bin
ENV GOGC 10   # less memory usage
EXPOSE 29900/udp
EXPOSE 12948
