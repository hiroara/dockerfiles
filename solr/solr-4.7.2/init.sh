#!/bin/bash

set -e

SOLR_HOME=/solr_home

if [ ! -f ${SOLR_HOME}/solr.xml ]; then
  echo "There is no solr.xml file in ${SOLR_HOME}. Copy example files..."
  cp -R ${TARGET_SOLR_DIR}/example/solr/* /solr_home/
fi

exec "$@"
