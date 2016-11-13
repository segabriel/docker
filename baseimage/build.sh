#!/bin/bash
IMAGE_NAME="segabriel/baseimage"

#docker rmi -f ${IMAGE_NAME}
docker build -t ${IMAGE_NAME} .