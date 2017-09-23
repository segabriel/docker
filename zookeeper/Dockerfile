FROM segabriel/java:8

MAINTAINER segabriel <sergiy.gabriel@gmail.com>

ENV ZOOKEEPER_VERSION 3.4.10
ENV ZOOKEEPER_TGZ_URL http://mirror.vorboss.net/apache/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz
ENV ZOOKEEPER_HOME /opt/zookeeper

WORKDIR $ZOOKEEPER_HOME

# Get Zookeeper
RUN set -e \
	&& curl -SL# "$ZOOKEEPER_TGZ_URL" -o /zookeeper.tar.gz \
	&& tar -zxf /zookeeper.tar.gz --strip-components=1 -C ./ \
	&& rm /zookeeper.tar.gz* \
	&& mkdir $ZOOKEEPER_HOME/data \
	&& mv $ZOOKEEPER_HOME/conf/zoo_sample.cfg $ZOOKEEPER_HOME/conf/zoo.cfg \
	&& sed -i "s|/tmp/zookeeper|$ZOOKEEPER_HOME/data|g" $ZOOKEEPER_HOME/conf/zoo.cfg \
	&& sed -i -r 's|#(log4j.appender.ROLLINGFILE.MaxBackupIndex.*)|\1|g' $ZOOKEEPER_HOME/conf/log4j.properties \
    && sed -i -r 's|#autopurge|autopurge|g' $ZOOKEEPER_HOME/conf/zoo.cfg

RUN mkdir /etc/service/zookeeper
COPY start.sh /etc/service/zookeeper/run
RUN chmod +x /etc/service/zookeeper/run

COPY docker-entrypoint.sh /docker-zookeeper-entrypoint.sh
RUN chmod +x /docker-zookeeper-entrypoint.sh
ENTRYPOINT ["/docker-zookeeper-entrypoint.sh"]

CMD ["/sbin/my_init"]

EXPOSE 2181 2888 3888

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
