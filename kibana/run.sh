#!/bin/bash
CONTAINER_NAME="kibana"
IMAGE_NAME="segabriel/kibana:5.1.1"

docker stop ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}

docker run \
	--detach \
	--publish 5601:5601 \
	--name ${CONTAINER_NAME} \
	${IMAGE_NAME}

docker inspect ${CONTAINER_NAME}
docker logs -f ${CONTAINER_NAME}
