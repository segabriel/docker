#!/bin/bash
CONTAINER_NAME="elasticsearch"
IMAGE_NAME="segabriel/elasticsearch:5.1.1"
ELASTICSEARCH_VOLUME_DATA_STORAGE="/opt/elasticsearch/data"

rm -rf ${ELASTICSEARCH_VOLUME_DATA_STORAGE}
mkdir -p ${ELASTICSEARCH_VOLUME_DATA_STORAGE}
chmod -R 777 ${ELASTICSEARCH_VOLUME_DATA_STORAGE}

docker stop ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}

docker run \
	--detach \
	--publish 9200:9200 \
	--publish 9300:9300 \
	--volume ${ELASTICSEARCH_VOLUME_DATA_STORAGE}:/usr/share/elasticsearch/data \
	--name ${CONTAINER_NAME} \
	${IMAGE_NAME}

docker inspect ${CONTAINER_NAME}
docker logs -f ${CONTAINER_NAME}
