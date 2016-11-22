#!/bin/bash
CONTAINER_NAME="activemq"
IMAGE_NAME="segabriel/activemq:5.14.1"

docker stop ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}

docker run \
	--detach \
	--publish 61616:61616 \
	--publish 8161:8161 \
	--name ${CONTAINER_NAME} \
	${IMAGE_NAME}

docker inspect ${CONTAINER_NAME}
docker logs -f ${CONTAINER_NAME}
