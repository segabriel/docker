#!/bin/bash

export DOCKER_KAFKA_HOST=$(ipconfig getifaddr en0)

docker-compose up -d
