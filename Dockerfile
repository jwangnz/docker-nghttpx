FROM alpine:edge

RUN apk add nghttp2 python openssl ca-certificates --update-cache && rm -rf /var/cache/apk/*

ENTRYPOINT ["nghttpx"]
CMD ["--help"]
