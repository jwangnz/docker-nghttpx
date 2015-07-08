FROM alpine:3.2

RUN apk add --update libev-dev jansson-dev openssl-dev jemalloc-dev gcc g++ make python && rm -rf /var/cache/apk/*

ENV SPDYLAY_VERSION=1.3.2 NGHTTP2_VERSION=1.0.5

ADD https://github.com/tatsuhiro-t/spdylay/releases/download/v${SPDYLAY_VERSION}/spdylay-${SPDYLAY_VERSION}.tar.gz /spdylay.tar.gz
RUN tar zxf /spdylay.tar.gz && cd spdylay-${SPDYLAY_VERSION} && \
  ./configure --prefix=/usr --disable-src --disable-examples && make && make install && \
  cd - && rm -rf spdylay.tar.gz spdylay-${SPDYLAY_VERSION}

ADD https://github.com/tatsuhiro-t/nghttp2/releases/download/v${NGHTTP2_VERSION}/nghttp2-${NGHTTP2_VERSION}.tar.gz /nghttp2.tar.gz
RUN tar zxf /nghttp2.tar.gz && cd nghttp2-${NGHTTP2_VERSION} && \
  ./configure --prefix=/usr --enable-app --disable-examples && make && make install && \
  cd - && rm -rf nghttp2.tar.gz nghttp2-${NGHTTP2_VERSION}

ENTRYPOINT ["nghttpx"]
CMD ["--help"]
