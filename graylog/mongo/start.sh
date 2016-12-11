#!/bin/bash
set -e

/sbin/setuser mongodb mongod

exec "$@"
