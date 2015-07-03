FROM ubuntu:14.04

MAINTAINER "Hiroki Arai <hiroara62@gmail.com>"

RUN apt-get update && apt-get -yq install git-core autoconf libtool build-essential redis-tools

ENV SRC_DIR=/usr/local/src/twemproxy

RUN mkdir -p ${SRC_DIR} && git clone https://github.com/twitter/twemproxy.git ${SRC_DIR}

RUN cd ${SRC_DIR} && \
  autoreconf -fvi && \
  ./configure && \
  make && \
  ln -s ${SRC_DIR}/src/nutcracker /usr/bin/nutcracker

ADD ./init.sh /tmp/init.sh

WORKDIR /work

ENTRYPOINT ["/tmp/init.sh"]

CMD /usr/bin/nutcracker -c /tmp/nutcracker.yml
