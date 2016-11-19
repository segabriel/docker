#!/bin/bash
set -e

${CATALINA_HOME}/bin/catalina.sh run

exec "$@"
