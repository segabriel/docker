#!/bin/bash
CONTAINER_NAME="mongo"
IMAGE_NAME="segabriel/mongo:3.3.15"
MONGO_VOLUME_DATA_STORAGE="/opt/mongo/data/db"
MONGO_VOLUME_DATA_CONFIG="/opt/mongo/data/configdb"

mkdir -p ${MONGO_VOLUME_DATA_STORAGE} ${MONGO_VOLUME_DATA_CONFIG}
chmod -R 777 ${MONGO_VOLUME_DATA_STORAGE} ${MONGO_VOLUME_DATA_CONFIG}

docker stop ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}

docker run \
	--detach \
	--volume ${MONGO_VOLUME_DATA_STORAGE}:/data/db \
	--volume ${MONGO_VOLUME_DATA_CONFIG}:/data/configdb \
	--publish 27017:27017 \
	--name ${CONTAINER_NAME} \
	${IMAGE_NAME}

docker inspect ${CONTAINER_NAME}
docker logs -f ${CONTAINER_NAME}

