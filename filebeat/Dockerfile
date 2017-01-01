FROM segabriel/baseimage

MAINTAINER segabriel <sergiy.gabriel@gmail.com>

ENV FILEBEAT_VERSION 5.1.1
ENV FILEBEAT_TGZ_URL https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-$FILEBEAT_VERSION-linux-x86_64.tar.gz
ENV FILEBEAT_HOME /usr/share/filebeat
ENV PATH /usr/share/filebeat:$PATH

WORKDIR ${FILEBEAT_HOME}

RUN set -e \
	&& curl -SL# "$FILEBEAT_TGZ_URL" -o /filebeat.tar.gz \
	&& tar -zxf /filebeat.tar.gz --strip-components=1 -C ./ \
	&& rm /filebeat.tar.gz*

COPY config ${FILEBEAT_HOME}

RUN mkdir /etc/service/filebeat
COPY start.sh /etc/service/filebeat/run
RUN chmod +x /etc/service/filebeat/run

COPY docker-entrypoint.sh /docker-filebeat-entrypoint.sh
RUN chmod +x /docker-filebeat-entrypoint.sh
ENTRYPOINT ["/docker-filebeat-entrypoint.sh"]

CMD ["/sbin/my_init"]

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
