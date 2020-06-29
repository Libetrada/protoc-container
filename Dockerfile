FROM cimg/base:2020.06

RUN sudo apt-get update \
    && sudo apt-get install -y curl unzip \
    && sudo apt-get clean \
    && sudo rm -rf /var/lib/apt/lists/*

# protoc
ARG PROTOC_VERSION=3.12.3
RUN curl -LO https://github.com/protocolbuffers/protobuf/releases/download/v$PROTOC_VERSION/protoc-$PROTOC_VERSION-linux-x86_64.zip \
    && sudo unzip protoc-$PROTOC_VERSION-linux-x86_64.zip -d /usr/local \
    && chmod 755 /usr/local/bin/protoc \
    && rm protoc-$PROTOC_VERSION-linux-x86_64.zip

# protogendoc
ARG GEN_DOC_VERSION=1.3.2
RUN curl -L https://github.com/pseudomuto/protoc-gen-doc/releases/download/v$GEN_DOC_VERSION/protoc-gen-doc-$GEN_DOC_VERSION.linux-amd64.go1.12.6.tar.gz | tar -xz \
    && sudo install protoc-gen-doc-$GEN_DOC_VERSION.linux-amd64.go1.12.6/protoc-gen-doc /usr/local/bin \
    && rm -rf protoc-gen-doc-$GEN_DOC_VERSION.linux-amd64.go1.12.6
