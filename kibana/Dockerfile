FROM segabriel/baseimage

MAINTAINER segabriel <sergiy.gabriel@gmail.com>

ENV KIBANA_VERSION 5.1.1
ENV KIBANA_TGZ_URL https://artifacts.elastic.co/downloads/kibana/kibana-$KIBANA_VERSION-linux-x86_64.tar.gz
ENV KIBANA_HOME /usr/share/kibana
ENV PATH /usr/share/kibana/bin:$PATH

WORKDIR ${KIBANA_HOME}

RUN set -e \
	&& curl -SL# "$KIBANA_TGZ_URL" -o /kibana.tar.gz \
	&& tar -zxf /kibana.tar.gz --strip-components=1 -C ./ \
	&& rm /kibana.tar.gz*

COPY config ${KIBANA_HOME}/config

RUN mkdir /etc/service/kibana
COPY start.sh /etc/service/kibana/run
RUN chmod +x /etc/service/kibana/run

COPY docker-entrypoint.sh /docker-kibana-entrypoint.sh
RUN chmod +x /docker-kibana-entrypoint.sh
ENTRYPOINT ["/docker-kibana-entrypoint.sh"]

CMD ["/sbin/my_init"]

EXPOSE 5601

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
