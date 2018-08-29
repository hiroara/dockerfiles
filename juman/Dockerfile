FROM ubuntu:16.04

MAINTAINER Hiroki Arai <hiroara62@gmail.com>

ARG JUMAN_VERSION=7.01

RUN apt-get update && apt-get install -y wget tar bzip2 cmake build-essential zlib1g-dev language-pack-ja && \

    cd /usr/local/src && \
    wget http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/juman/juman-${JUMAN_VERSION}.tar.bz2 && \

    tar xvf juman-${JUMAN_VERSION}.tar.bz2 && \
    cd juman-${JUMAN_VERSION} && \
    ./configure --prefix=/usr/local && \
    make && make install && \

    ldconfig && \
    rm -r /usr/local/src/juman-* && \
    rm -rf /var/lib/apt/lists/*
