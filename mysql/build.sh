#!/bin/bash
MYSQL_IMAGE_NAME="segabriel/mysql:5.7"

#docker rmi -f ${MYSQL_IMAGE_NAME}
docker build -t ${MYSQL_IMAGE_NAME} .
