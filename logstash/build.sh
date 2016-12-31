#!/bin/bash
IMAGE_NAME="segabriel/logstash:5.1.1"

#docker rmi -f ${IMAGE_NAME}
docker build -t ${IMAGE_NAME} .
