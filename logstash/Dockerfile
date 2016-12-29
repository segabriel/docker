FROM segabriel/java:8

MAINTAINER segabriel <sergiy.gabriel@gmail.com>

ENV LOGSTASH_VERSION 5.1.1
ENV LOGSTASH_TGZ_URL https://artifacts.elastic.co/downloads/logstash/logstash-$LOGSTASH_VERSION.tar.gz
ENV LS_HOME /usr/share/logstash
ENV PATH /usr/share/logstash/bin:$PATH

RUN groupadd -r logstash && useradd -r -g logstash logstash

WORKDIR ${LS_HOME}

RUN set -e \
	&& curl -SL# "$LOGSTASH_TGZ_URL" -o /logstash.tar.gz \
	&& tar -zxf /logstash.tar.gz --strip-components=1 -C ./ \
	&& rm /logstash.tar.gz* \
	&& chown -R logstash:logstash ./ ./config ./data

COPY config ./config

RUN mkdir /etc/service/logstash
COPY start.sh /etc/service/logstash/run
RUN chmod +x /etc/service/logstash/run

COPY docker-entrypoint.sh /docker-logstash-entrypoint.sh
RUN chmod +x /docker-logstash-entrypoint.sh
ENTRYPOINT ["/docker-logstash-entrypoint.sh"]

CMD ["/sbin/my_init"]

EXPOSE 5000

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
