FROM hiroara/juman:latest

MAINTAINER Hiroki Arai <hiroara62@gmail.com>

ARG KNP_VERSION=4.19

RUN cd /usr/local/src && \
    wget http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/knp/knp-${KNP_VERSION}.tar.bz2 && \

    tar xvf knp-${KNP_VERSION}.tar.bz2 && \
    cd knp-${KNP_VERSION} && \
    ./configure --prefix=/usr/local --with-juman-prefix=/usr/local && \
    make && make install && \

    rm -r /usr/local/src/knp-*
