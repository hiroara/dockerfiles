#!/bin/bash

set -e

if [ -n ${NUTCRACKERYML_KEY} ]; then
  mkdir conf
  echo -e "$(redis-cli -h ${NUTCRACKERYML_HOST:-localhost} -p ${NUTCRACKERYML_PORT:-6379} get ${NUTCRACKERYML_KEY})" > conf/nutcracker.yml
fi

eval "$@"
