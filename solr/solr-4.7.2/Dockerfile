FROM java
MAINTAINER Hiroki Arai "hiroara62@gmail.com"

ENV SOLR_VERSION 4.7.2
ENV TARGET_DIR /opt
ENV TARGET_SOLR_DIR ${TARGET_DIR}/solr
ENV TARGET_BASENAME ${TARGET_DIR}/solr-${SOLR_VERSION}
ENV MIRROR_SITE http://ftp.meisei-u.ac.jp/mirror/apache/dist
ENV JAVA_XMS 512M
ENV JAVA_XMX 1G

RUN apt-get update && \
  mkdir -p $TARGET_DIR && \
  echo Downloading solr... && \
  wget -nv -O ${TARGET_BASENAME}.tgz ${MIRROR_SITE}/lucene/solr/${SOLR_VERSION}/solr-${SOLR_VERSION}.tgz && \
  tar xz -C ${TARGET_DIR} -f ${TARGET_BASENAME}.tgz && \
  rm ${TARGET_BASENAME}.tgz && \
  ln -s ${TARGET_DIR}/solr-${SOLR_VERSION} ${TARGET_SOLR_DIR}

EXPOSE 8983

WORKDIR ${TARGET_SOLR_DIR}/example

VOLUME /solr_data
VOLUME /solr_home

ADD init.sh /tmp/init.sh

ENTRYPOINT ["/tmp/init.sh"]

CMD ["/bin/bash", "-c", "/usr/bin/java -Xms${JAVA_XMS} -Xmx${JAVA_XMX} -Djetty.port=8983 -Dsolr.data.dir=/solr_data -Dsolr.solr.home=/solr_home -jar start.jar"]
