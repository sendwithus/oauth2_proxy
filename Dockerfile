FROM golang:1.10-alpine
COPY . /go/src/github.com/bitly/oauth2_proxy
RUN go build -ldflags="-s -w" -o /go/bin/oauth2-proxy github.com/bitly/oauth2_proxy

FROM alpine:latest
RUN apk add --no-cache ca-certificates
COPY --from=0 /go/bin /bin/
ENTRYPOINT [ "/bin/oauth2-proxy" ]
