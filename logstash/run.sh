#!/bin/bash
CONTAINER_NAME="logstash"
IMAGE_NAME="segabriel/logstash:5.1.1"

docker stop ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}

docker run \
	--detach \
	--name ${CONTAINER_NAME} \
	${IMAGE_NAME}

docker inspect ${CONTAINER_NAME}
docker logs -f ${CONTAINER_NAME}
