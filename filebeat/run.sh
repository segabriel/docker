#!/bin/bash
CONTAINER_NAME="filebeat"
IMAGE_NAME="segabriel/filebeat:5.1.1"

LOGS_HOME="/opt/filebeat/logs"

docker stop ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}

rm -rf ${LOGS_HOME}
mkdir -p ${LOGS_HOME}
chmod -R 777 ${LOGS_HOME}

docker run \
	--detach \
	--volume ${LOGS_HOME}:/var/log \
	--name ${CONTAINER_NAME} \
	${IMAGE_NAME}

docker inspect ${CONTAINER_NAME}
docker logs -f ${CONTAINER_NAME}
