#!/bin/bash
CONTAINER_NAME="zookeeper"
IMAGE_NAME="segabriel/zookeeper:3.4.10"

docker stop ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}

docker run \
	--detach \
	--publish 2181:2181 \
	--name ${CONTAINER_NAME} \
	${IMAGE_NAME}

docker inspect ${CONTAINER_NAME}
docker logs -f ${CONTAINER_NAME}
