#!/bin/bash
CONTAINER_NAME="tomcat"
IMAGE_NAME="segabriel/tomcat:8.5.8"
#TOMCAT_WEBAPPS="/opt/tomcat/webapps"

#mkdir -p ${TOMCAT_WEBAPPS}
#chmod -R 777 ${TOMCAT_WEBAPPS}

docker stop ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}

docker run \
	--detach \
	--publish 8090:8080 \
	--name ${CONTAINER_NAME} \
	${IMAGE_NAME}

docker inspect ${CONTAINER_NAME}
docker logs -f ${CONTAINER_NAME}
