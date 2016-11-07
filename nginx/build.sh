#!/bin/bash
IMAGE_NAME="segabriel/nginx:latest"

docker rmi -f ${IMAGE_NAME}
docker build -t ${IMAGE_NAME} .