#!/bin/bash
CONTAINER_NAME="nginx"
IMAGE_NAME="segabriel/nginx:latest"

docker stop ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}

docker run \
	--detach \
	--publish 8080:8080 \
	--publish 443:443 \
	--name ${CONTAINER_NAME} \
	${IMAGE_NAME}

docker inspect ${CONTAINER_NAME}
docker logs -f ${CONTAINER_NAME}
