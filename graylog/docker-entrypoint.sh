#!/bin/bash
set -e

# Delete outdated PID file
rm -f /tmp/graylog.pid

exec "$@"
