#!/bin/bash
IMAGE_NAME="segabriel/graylog:2.1.2"

#docker rmi -f ${IMAGE_NAME}
docker build -t ${IMAGE_NAME} .
