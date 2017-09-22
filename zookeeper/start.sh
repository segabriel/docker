#!/bin/bash
set -e

${ZOOKEEPER_HOME}/bin/zkServer.sh start-foreground

exec "$@"
