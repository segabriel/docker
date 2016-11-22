#!/bin/bash
set -e

/sbin/setuser activemq java -jar ${ACTIVEMQ_HOME}/bin/activemq.jar start

exec "$@"
