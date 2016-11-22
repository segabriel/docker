#!/bin/bash
IMAGE_NAME="segabriel/activemq:5.14.1"

#docker rmi -f ${IMAGE_NAME}
docker build -t ${IMAGE_NAME} .
