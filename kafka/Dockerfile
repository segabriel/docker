FROM segabriel/java:8

MAINTAINER segabriel <sergiy.gabriel@gmail.com>

ENV KAFKA_VERSION 0.11.0.1
ENV SCALA_VERSION 2.12
ENV KAFKA_TGZ_URL http://www.us.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz
ENV KAFKA_HOME /opt/kafka
ENV PATH ${PATH}:${KAFKA_HOME}/bin

WORKDIR $KAFKA_HOME

# Get Kafka
RUN set -e \
	&& curl -SL# "$KAFKA_TGZ_URL" -o /kafka.tar.gz \
	&& tar -zxf /kafka.tar.gz --strip-components=1 -C ./ \
	&& rm /kafka.tar.gz*

RUN mkdir /etc/service/kafka
COPY start.sh /etc/service/kafka/run
COPY create-topics.sh /etc/service/kafka/create-topics.sh
RUN chmod +x /etc/service/kafka/run /etc/service/kafka/create-topics.sh

COPY docker-entrypoint.sh /docker-kafka-entrypoint.sh
RUN chmod +x /docker-kafka-entrypoint.sh
ENTRYPOINT ["/docker-kafka-entrypoint.sh"]

CMD ["/sbin/my_init"]

EXPOSE 9092

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
