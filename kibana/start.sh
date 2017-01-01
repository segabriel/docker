#!/bin/bash
set -e

/sbin/setuser root kibana

exec "$@"
