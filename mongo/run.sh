#!/bin/bash
CONTAINER_NAME="mongo"
IMAGE_NAME="segabriel/mongo:3.3.15"
MONGO_DATASTORAGE="/opt/mongo/data/db"
MONGO_CONFIG_DATASTORAGE="/opt/mongo/data/configdb"

mkdir -p ${MONGO_DATASTORAGE} ${MONGO_CONFIG_DATASTORAGE}
chmod -R 777 ${MONGO_DATASTORAGE} ${MONGO_CONFIG_DATASTORAGE}

docker stop ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}

docker run \
	--detach \
	--volume ${MONGO_DATASTORAGE}:/data/db \
	--volume ${MONGO_CONFIG_DATASTORAGE}:/data/configdb \
	--publish 27017:27017 \
	--name ${CONTAINER_NAME} \
	${IMAGE_NAME}

docker inspect ${CONTAINER_NAME}
docker logs -f ${CONTAINER_NAME}
