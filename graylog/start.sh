#!/bin/bash
set -e

/sbin/setuser graylog java $GRAYLOG_SERVER_JAVA_OPTS \
      -jar \
      -Dlog4j.configurationFile=/usr/share/graylog/data/config/log4j2.xml \
      -Djava.library.path=/usr/share/graylog/lib/sigar/ \
      -Dgraylog2.installation_source=docker /usr/share/graylog/graylog.jar \
      server \
      -f /usr/share/graylog/data/config/graylog.conf

exec "$@"
