#!/bin/bash
IMAGE_NAME="segabriel/mongo:3.3.15"

#docker rmi -f ${IMAGE_NAME}
docker build -t ${IMAGE_NAME} .
