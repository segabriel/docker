#!/bin/bash
CONTAINER_NAME="nginx"
IMAGE_NAME="segabriel/nginx:latest"

docker stop ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}

docker run \
	--detach \
	--publish 80:80 \
	--publish 444:443 \
	--name ${CONTAINER_NAME} \
	${IMAGE_NAME}

docker inspect ${CONTAINER_NAME}
docker logs -f ${CONTAINER_NAME}
