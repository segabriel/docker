#!/bin/bash
set -e

/sbin/setuser elasticsearch elasticsearch ${ELASTICSEARCH_OPTS}

exec "$@"
