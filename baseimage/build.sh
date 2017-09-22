#!/bin/bash
IMAGE_NAME="segabriel/baseimage:0.9.22"

#docker rmi -f ${IMAGE_NAME}
docker build -f Dockerfile -t ${IMAGE_NAME} .
