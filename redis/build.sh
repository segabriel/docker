#!/bin/bash
IMAGE_NAME="segabriel/redis:4.0.2"

#docker rmi -f ${IMAGE_NAME}
docker build -f Dockerfile -t ${IMAGE_NAME} .
