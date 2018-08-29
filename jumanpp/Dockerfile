FROM ubuntu:16.04

MAINTAINER Hiroki Arai <hiroara62@gmail.com>

ARG JUMANPP_VERSION=2.0.0-rc2

RUN apt-get update && apt-get install -y wget tar xz-utils cmake build-essential zlib1g-dev language-pack-ja && \

    cd /usr/local/src && \
    wget https://github.com/ku-nlp/jumanpp/releases/download/v${JUMANPP_VERSION}/jumanpp-${JUMANPP_VERSION}.tar.xz && \

    tar xvf jumanpp-${JUMANPP_VERSION}.tar.xz && \
    cd jumanpp-${JUMANPP_VERSION} && \
    mkdir build && \
    cd build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local && \
    make install -j4 && \

    rm -r /usr/local/src/jumanpp-* && \
    rm -rf /var/lib/apt/lists/*
