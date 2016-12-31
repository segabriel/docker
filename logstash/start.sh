#!/bin/bash
set -e

/sbin/setuser logstash logstash -f ${LS_HOME}/config/logstash.conf

exec "$@"
