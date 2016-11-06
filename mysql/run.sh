#!/bin/bash
MYSQL_ROOT_PASSWORD="rootSecretPassword"

MYSQL_USER="development"
MYSQL_PASSWORD="userSecretPassword"
MYSQL_DATABASE="dataBaseName"

MYSQL_CONTAINER_NAME="mysql"
MYSQL_IMAGE_NAME="segabriel/mysql:5.7"
MYSQL_DATASTORAGE="/opt/mysql/data"

mkdir -p ${MYSQL_DATASTORAGE}
chmod -R 777 ${MYSQL_DATASTORAGE}

docker stop ${MYSQL_CONTAINER_NAME}
docker rm ${MYSQL_CONTAINER_NAME}

docker run \
	--detach \
	--env MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} \
	--env MYSQL_USER=${MYSQL_USER} \
	--env MYSQL_PASSWORD=${MYSQL_PASSWORD} \
	--env MYSQL_DATABASE=${MYSQL_DATABASE} \
	--volume ${MYSQL_DATASTORAGE}:/var/lib/mysql \
	--publish 3306:3306 \
	--name ${MYSQL_CONTAINER_NAME} \
	${MYSQL_IMAGE_NAME}

docker inspect ${MYSQL_CONTAINER_NAME}
docker logs -f ${MYSQL_CONTAINER_NAME}