FROM golang:1.14.2 AS builder

RUN git clone https://github.com/rakyll/hey.git

RUN GOOS=linux   GOARCH=amd64  CGO_ENABLED=0 \
    go get -u github.com/rakyll/hey

FROM alpine:3.10.0
LABEL author="lewis@denhamparry.co.uk"

COPY --from=builder /go/bin/hey  /

ENTRYPOINT ["/hey"]
