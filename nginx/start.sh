#!/bin/bash
set -e

nginx

exec "$@"
