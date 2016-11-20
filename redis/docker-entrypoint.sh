#!/bin/bash
set -e

if [ "$REDIS_CONFIG" ]; then
	if [ "$REDIS_DATA_STORAGE" ]; then
		mkdir -p ${REDIS_DATA_STORAGE} && chown redis:redis -R ${REDIS_DATA_STORAGE}
		sed -i "s#REDIS_DATA_STORAGE#${REDIS_DATA_STORAGE}#g" ${REDIS_CONFIG}
	fi
	if [ "$REDIS_LOG_STORAGE" ]; then
		mkdir -p ${REDIS_LOG_STORAGE} && chown redis:redis -R ${REDIS_LOG_STORAGE}
		sed -i "s#REDIS_LOG_FILE#${REDIS_LOG_STORAGE}/redis.log#g" ${REDIS_CONFIG}
	fi
fi

exec "$@"
