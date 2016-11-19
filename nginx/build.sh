#!/bin/bash
IMAGE_NAME="segabriel/nginx:1.11.6"

#docker rmi -f ${IMAGE_NAME}
docker build -t ${IMAGE_NAME} .
