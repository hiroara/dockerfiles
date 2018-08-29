FROM ubuntu:16.04

MAINTAINER Hiroki Arai <hiroara62@gmail.com>

ARG JUMANPP_VERSION=2.0.0-rc2
ARG JUMAN_VERSION=7.01

RUN apt-get update && apt-get install -y wget tar xz-utils bzip2 cmake build-essential zlib1g-dev language-pack-ja-base language-pack-ja && \

    cd /usr/local/src && \
    if ! [ -f jumanpp-${JUMANPP_VERSION}.tar.xz ]; then \
      wget https://github.com/ku-nlp/jumanpp/releases/download/v${JUMANPP_VERSION}/jumanpp-${JUMANPP_VERSION}.tar.xz; \
    fi && \

    if ! [ -f juman-${JUMAN_VERSION}.tar.bz2 ]; then \
      wget http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/juman/juman-${JUMAN_VERSION}.tar.bz2; \
    fi && \

    tar xvf jumanpp-${JUMANPP_VERSION}.tar.xz && \
    cd jumanpp-${JUMANPP_VERSION} && \
    mkdir build && \
    cd build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local && \
    make install -j4 && \

    cd /usr/local/src && \
    tar xvf juman-${JUMAN_VERSION}.tar.bz2 && \
    cd juman-${JUMAN_VERSION} && \
    ./configure --prefix=/usr/local && \
    make && make install && \

    ldconfig && \
    rm -r /usr/local/src/juman-* && rm -r /usr/local/src/jumanpp-* && \
    rm -rf /var/lib/apt/lists/*
