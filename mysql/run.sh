#!/bin/bash
MYSQL_ROOT_PASSWORD="rootSecretPassword"

MYSQL_USER="development"
MYSQL_PASSWORD="userSecretPassword"
MYSQL_DATABASE="dataBaseName"

MYSQL_REMOTE_ROOT_NAME="remote"
MYSQL_REMOTE_ROOT_PASS="remoteSecretPassword"

MYSQL_CONTAINER_NAME="mysql"
MYSQL_IMAGE_NAME="segabriel/mysql:5.7"
MYSQL_DATA_HOME="/opt/mysql/data"
MYSQL_LOG_HOME="/opt/mysql/log"

rm -rf ${MYSQL_DATA_HOME}
mkdir -p ${MYSQL_DATA_HOME}
chmod -R 777 ${MYSQL_DATA_HOME}
rm -rf ${MYSQL_LOG_HOME}
mkdir -p ${MYSQL_LOG_HOME}
chmod -R 777 ${MYSQL_LOG_HOME}

docker stop ${MYSQL_CONTAINER_NAME}
docker rm ${MYSQL_CONTAINER_NAME}

docker run \
	--detach \
	--env MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} \
	--env MYSQL_USER=${MYSQL_USER} \
	--env MYSQL_PASSWORD=${MYSQL_PASSWORD} \
	--env MYSQL_DATABASE=${MYSQL_DATABASE} \
	--env MYSQL_REMOTE_ROOT_NAME=${MYSQL_REMOTE_ROOT_NAME} \
	--env MYSQL_REMOTE_ROOT_PASS=${MYSQL_REMOTE_ROOT_PASS} \
	--volume ${MYSQL_DATA_HOME}:/var/lib/mysql \
	--volume ${MYSQL_LOG_HOME}:/var/log/mysql \
	--publish 3306:3306 \
	--name ${MYSQL_CONTAINER_NAME} \
	${MYSQL_IMAGE_NAME}

docker inspect ${MYSQL_CONTAINER_NAME}
docker logs -f ${MYSQL_CONTAINER_NAME}
