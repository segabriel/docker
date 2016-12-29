FROM segabriel/java:8

MAINTAINER segabriel <sergiy.gabriel@gmail.com>

ENV ELASTICSEARCH_VERSION 5.1.1
ENV ELASTICSEARCH_TGZ_URL https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-$ELASTICSEARCH_VERSION.tar.gz
ENV ES_HOME /usr/share/elasticsearch
ENV ELASTICSEARCH_VOLUME_DATA_STORAGE $ES_HOME/data
ENV ES_JAVA_OPTS ""
ENV PATH /usr/share/elasticsearch/bin:$PATH

RUN groupadd -r elasticsearch && useradd -r -g elasticsearch elasticsearch

WORKDIR /usr/share/elasticsearch

RUN set -e \
	&& curl -SL# "$ELASTICSEARCH_TGZ_URL" -o /elasticsearch.tar.gz \
	&& tar -zxf /elasticsearch.tar.gz --strip-components=1 -C ./ \
	&& rm /elasticsearch.tar.gz* \
	&& mkdir -p $ELASTICSEARCH_VOLUME_DATA_STORAGE ./logs ./config ./config/scripts \
	&& chown -R elasticsearch:elasticsearch $ELASTICSEARCH_VOLUME_DATA_STORAGE ./logs ./config ./config/scripts

COPY config ./config

RUN mkdir /etc/service/elasticsearch
COPY start.sh /etc/service/elasticsearch/run
RUN chmod +x /etc/service/elasticsearch/run

COPY docker-entrypoint.sh /docker-elasticsearch-entrypoint.sh
RUN chmod +x /docker-elasticsearch-entrypoint.sh
ENTRYPOINT ["/docker-elasticsearch-entrypoint.sh"]

CMD ["/sbin/my_init"]

EXPOSE 9200 9300

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
