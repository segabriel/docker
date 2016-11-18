#!/bin/bash
MYSQL_ROOT_PASSWORD="rootSecretPassword"

MYSQL_USER="development"
MYSQL_PASSWORD="userSecretPassword"
MYSQL_DATABASE="dataBaseName"

MYSQL_REMOTE_ROOT_NAME="remote"
MYSQL_REMOTE_ROOT_PASS="remoteSecretPassword"

MYSQL_CONTAINER_NAME="mysql"
MYSQL_IMAGE_NAME="segabriel/mysql:5.7"
MYSQL_VOLUME_HOME="/opt/mysql/data"

rm -rf ${MYSQL_VOLUME_HOME}
mkdir -p ${MYSQL_VOLUME_HOME}
chmod -R 777 ${MYSQL_VOLUME_HOME}

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
	--volume ${MYSQL_VOLUME_HOME}:/var/lib/mysql \
	--publish 3306:3306 \
	--name ${MYSQL_CONTAINER_NAME} \
	${MYSQL_IMAGE_NAME}

docker inspect ${MYSQL_CONTAINER_NAME}
docker logs -f ${MYSQL_CONTAINER_NAME}
