#!/bin/bash
set -e

/sbin/setuser elasticsearch elasticsearch

exec "$@"
