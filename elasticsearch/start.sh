#!/bin/bash
set -e

/sbin/setuser elasticsearch /usr/share/elasticsearch/bin/elasticsearch

exec "$@"
