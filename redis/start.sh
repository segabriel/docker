#!/bin/bash
set -e

/sbin/setuser redis /usr/local/bin/redis-server ${REDIS_CONFIG}

exec "$@"
