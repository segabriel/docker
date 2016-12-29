#!/bin/bash

#rm -rf /opt/graylog
mkdir -p /opt/graylog /opt/graylog/mongo/data /opt/graylog/elasticsearch/data
chmod -R 777 /opt/graylog /opt/graylog/mongo/data /opt/graylog/elasticsearch/data

docker-compose up -d
