#!/bin/bash
CONTAINER_NAME="baseimage"
IMAGE_NAME="segabriel/baseimage"

docker stop ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}

docker run \
	-it --rm\
	--name ${CONTAINER_NAME} \
	${IMAGE_NAME}
