#!/bin/bash
set -e

/sbin/setuser root filebeat -e -c ${FILEBEAT_HOME}/filebeat.yml

exec "$@"
