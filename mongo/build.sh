#!/bin/bash
IMAGE_NAME="segabriel/mongo:3.4.2"

#docker rmi -f ${IMAGE_NAME}
docker build -t ${IMAGE_NAME} .
