#!/bin/bash
set -e

/sbin/setuser mysql /usr/bin/mysqld_safe

exec "$@"
