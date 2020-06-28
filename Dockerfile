FROM ubuntu:18.04

WORKDIR /tmp

RUN apt-get update \
    && apt-get install -y curl unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# protoc
ARG PROTOC_VERSION=3.12.3
RUN curl -LO https://github.com/protocolbuffers/protobuf/releases/download/v$PROTOC_VERSION/protoc-$PROTOC_VERSION-linux-x86_64.zip \
    && unzip protoc-$PROTOC_VERSION-linux-x86_64.zip -d /usr/local \
    && rm protoc-$PROTOC_VERSION-linux-x86_64.zip

# protogendoc
ARG GEN_DOC_VERSION=1.3.2
RUN curl -L https://github.com/pseudomuto/protoc-gen-doc/releases/download/v$GEN_DOC_VERSION/protoc-gen-doc-$GEN_DOC_VERSION.linux-amd64.go1.12.6.tar.gz | tar -xz \
    && install protoc-gen-doc-$GEN_DOC_VERSION.linux-amd64.go1.12.6/protoc-gen-doc /usr/local/bin \
    && rm -rf protoc-gen-doc-$GEN_DOC_VERSION.linux-amd64.go1.12.6

WORKDIR /

ADD entrypoint.sh .

VOLUME ["/out", "/protos"]

ENTRYPOINT ["entrypoint.sh"]
CMD ["--doc_opt=html,index.html"]
