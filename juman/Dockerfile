FROM ubuntu:16.04

MAINTAINER Hiroki Arai <hiroara62@gmail.com>

COPY src /usr/local/src

ARG JUMANPP_VERSION=2.0.0-rc2
ARG JUMAN_VERSION=7.01
ARG KNP_VERSION=4.19

RUN apt-get update && apt-get install -y wget tar xz-utils bzip2 cmake build-essential zlib1g-dev language-pack-ja-base language-pack-ja

RUN cd /usr/local/src && \
    if ! [ -f jumanpp-${JUMANPP_VERSION}.tar.xz ]; then \
      wget https://github.com/ku-nlp/jumanpp/releases/download/v${JUMANPP_VERSION}/jumanpp-${JUMANPP_VERSION}.tar.xz; \
    fi

RUN cd /usr/local/src && \
    if ! [ -f juman-${JUMAN_VERSION}.tar.bz2 ]; then \
      wget http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/juman/juman-${JUMAN_VERSION}.tar.bz2; \
    fi

RUN cd /usr/local/src && \
    if ! [ -f knp-${KNP_VERSION}.tar.bz2 ]; then \
      wget http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/knp/knp-${KNP_VERSION}.tar.bz2; \
    fi

RUN cd /usr/local/src && \
    tar xvf jumanpp-${JUMANPP_VERSION}.tar.xz && \
    cd jumanpp-${JUMANPP_VERSION} && \
    mkdir build && \
    cd build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local && \
    make install -j4

RUN cd /usr/local/src && \
    tar xvf juman-${JUMAN_VERSION}.tar.bz2 && \
    cd juman-${JUMAN_VERSION} && \
    ./configure --prefix=/usr/local && \
    make && make install

RUN cd /usr/local/src && \
    tar xvf knp-${KNP_VERSION}.tar.bz2 && \
    cd knp-${KNP_VERSION} && \
    ./configure --prefix=/usr/local --with-juman-prefix=/usr/local && \
    make && make install

RUN ldconfig && rm -r /usr/local/src/juman-* && rm -r /usr/local/src/jumanpp-* && rm -r /usr/local/src/knp-*
