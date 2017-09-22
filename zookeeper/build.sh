#!/bin/bash
IMAGE_NAME="segabriel/zookeeper:3.4.10"

#docker rmi -f ${IMAGE_NAME}
docker build -t ${IMAGE_NAME} .
