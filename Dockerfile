FROM alpine:edge

RUN apk add --no-cache nghttp2 python openssl ca-certificates

ENTRYPOINT ["nghttpx"]
CMD ["--help"]
