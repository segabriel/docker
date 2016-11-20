#!/bin/bash
IMAGE_NAME="segabriel/redis:3.2.5"

#docker rmi -f ${IMAGE_NAME}
docker build -t ${IMAGE_NAME} .
