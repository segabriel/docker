#!/bin/bash
IMAGE_NAME="segabriel/tomcat:8.5.8"

#docker rmi -f ${IMAGE_NAME}
docker build -t ${IMAGE_NAME} .
