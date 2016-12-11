#!/bin/bash
IMAGE_NAME="segabriel/graylog-elasticsearch:2.4.1"

#docker rmi -f ${IMAGE_NAME}
docker build -t ${IMAGE_NAME} .
