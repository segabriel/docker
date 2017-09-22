#!/bin/bash
IMAGE_NAME="segabriel/kafka:0.11.0.1"

#docker rmi -f ${IMAGE_NAME}
docker build -t ${IMAGE_NAME} .
