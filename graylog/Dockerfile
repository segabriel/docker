FROM segabriel/java:8

MAINTAINER segabriel <sergiy.gabriel@gmail.com>

ENV GRAYLOG_VERSION 2.1.2
ENV GRAYLOG_TGZ_URL https://packages.graylog2.org/releases/graylog/graylog-$GRAYLOG_VERSION.tgz
ENV GRAYLOG_SERVER_JAVA_OPTS "-Xms1g -Xmx2g -XX:NewRatio=1 -XX:MaxMetaspaceSize=256m -server -XX:+ResizeTLAB -XX:+UseConcMarkSweepGC -XX:+CMSConcurrentMTEnabled -XX:+CMSClassUnloadingEnabled -XX:+UseParNewGC -XX:-OmitStackTraceInFastThrow"
ENV GRAYLOG_DATA_STORAGE /usr/share/graylog/data
ENV GRAYLOG_LOG_STORAGE /usr/share/graylog/data/log
ENV GRAYLOG_CONFIG /usr/share/graylog/data/config
ENV GRAYLOG_JOURNAL /usr/share/graylog/data/journal
ENV GRAYLOG_CONTENTPACKS /usr/share/graylog/data/contentpacks
ENV PATH /usr/share/graylog/bin:$PATH

RUN groupadd -r graylog && useradd -r -g graylog graylog

WORKDIR /usr/share/graylog

RUN set -e \
	&& curl -SL# "$GRAYLOG_TGZ_URL" -o /graylog.tgz \
	&& tar -zxf /graylog.tgz --strip-components=1 -C /usr/share/graylog \
	&& rm /graylog.tgz* \
	&& chown -R graylog:graylog /usr/share/graylog \
	&& mkdir -p $GRAYLOG_DATA_STORAGE $GRAYLOG_LOG_STORAGE $GRAYLOG_CONFIG $GRAYLOG_JOURNAL $GRAYLOG_CONTENTPACKS \
	&& chown -R graylog:graylog $GRAYLOG_DATA_STORAGE $GRAYLOG_LOG_STORAGE $GRAYLOG_CONFIG $GRAYLOG_JOURNAL $GRAYLOG_CONTENTPACKS

COPY config $GRAYLOG_CONFIG

RUN mkdir /etc/service/graylog
COPY start.sh /etc/service/graylog/run
RUN chmod +x /etc/service/graylog/run

COPY docker-entrypoint.sh /docker-graylog-entrypoint.sh
RUN chmod +x /docker-graylog-entrypoint.sh
ENTRYPOINT ["/docker-graylog-entrypoint.sh"]

CMD ["/sbin/my_init"]

EXPOSE 9000 12900

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
