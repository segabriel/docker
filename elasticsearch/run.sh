#!/bin/bash
CONTAINER_NAME="elasticsearch"
IMAGE_NAME="segabriel/elasticserch:2.4.1"
ELASTICSEARCH_DATASTORAGE="/opt/elasticsearch/data"

mkdir -p ${ELASTICSEARCH_DATASTORAGE}
chmod -R 777 ${ELASTICSEARCH_DATASTORAGE}

docker stop ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}

docker run \
	--detach \
	--publish 9200:9200 \
	--publish 9300:9300 \
	--volume ${ELASTICSEARCH_DATASTORAGE}:/usr/share/elasticsearch/data \
	--name ${CONTAINER_NAME} \
	${IMAGE_NAME}

docker inspect ${CONTAINER_NAME}
docker logs -f ${CONTAINER_NAME}