#!/bin/bash
IMAGE_NAME="segabriel/java:8"

#docker rmi -f ${IMAGE_NAME}
docker build -t ${IMAGE_NAME} .