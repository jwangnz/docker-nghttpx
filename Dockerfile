FROM alpine:edge

RUN echo "http://dl-3.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories
RUN apk add nghttp2 python openssl ca-certificates --update-cache && rm -rf /var/cache/apk/*

ENTRYPOINT ["nghttpx"]
CMD ["--help"]
