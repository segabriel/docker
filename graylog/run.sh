#!/bin/bash

mkdir -p /opt/graylog
chmod -R 777 /opt/graylog

docker-compose up
