FROM alpine:3.12.0

WORKDIR /

RUN apk add --no-cache curl

ARG PROTOC_VERSION=3.12.3
RUN curl -LO https://github.com/protocolbuffers/protobuf/releases/download/v$PROTOC_VERSION/protoc-$PROTOC_VERSION-linux-x86_64.zip \
    && unzip protoc-$PROTOC_VERSION-linux-x86_64.zip -d /usr/local \
    && rm protoc-$PROTOC_VERSION-linux-x86_64.zip

VOLUME ["/out", "/protos"]

ENTRYPOINT ["protoc"]
