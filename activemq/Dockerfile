FROM segabriel/java:8

MAINTAINER segabriel <sergiy.gabriel@gmail.com>

ENV ACTIVEMQ_VERSION 5.14.1
ENV ACTIVEMQ_TGZ_URL https://archive.apache.org/dist/activemq/$ACTIVEMQ_VERSION/apache-activemq-$ACTIVEMQ_VERSION-bin.tar.gz
ENV ACTIVEMQ_TCP=61616 ACTIVEMQ_AMQP=5672 ACTIVEMQ_STOMP=61613 ACTIVEMQ_MQTT=1883 ACTIVEMQ_WS=61614 ACTIVEMQ_UI=8161
ENV ACTIVEMQ_HOME /opt/activemq
ENV ACTIVEMQ_CONF $ACTIVEMQ_HOME/conf
ENV ACTIVEMQ_DATA $ACTIVEMQ_HOME/data

WORKDIR $ACTIVEMQ_HOME

RUN groupadd -r activemq && useradd -r -g activemq activemq

# Get ActiveMQ
RUN set -e \
	&& curl -SL# "$ACTIVEMQ_TGZ_URL" -o /activemq.tar.gz \
	&& tar -zxf /activemq.tar.gz --strip-components=1 -C ./ \
	&& rm /activemq.tar.gz* \
    && chown -R activemq:activemq $ACTIVEMQ_HOME

COPY conf $ACTIVEMQ_CONF

RUN mkdir /etc/service/activemq
COPY start.sh /etc/service/activemq/run
RUN chmod +x /etc/service/activemq/run

COPY docker-entrypoint.sh /docker-activemq-entrypoint.sh
RUN chmod +x /docker-activemq-entrypoint.sh
ENTRYPOINT ["/docker-activemq-entrypoint.sh"]

CMD ["/sbin/my_init"]

EXPOSE $ACTIVEMQ_TCP $ACTIVEMQ_AMQP $ACTIVEMQ_STOMP $ACTIVEMQ_MQTT $ACTIVEMQ_WS $ACTIVEMQ_UI

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
