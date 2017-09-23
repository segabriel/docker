#!/bin/sh
docker login -u $DOCKER_USER -p $DOCKER_PASS
./build.sh
docker push segabriel/kafka
