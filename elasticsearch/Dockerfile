FROM segabriel/java:8

MAINTAINER segabriel <sergiy.gabriel@gmail.com>

ENV ELASTICSEARCH_VERSION 2.4.1
ENV ELASTICSEARCH_DEB_URL https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/$ELASTICSEARCH_VERSION/elasticsearch-$ELASTICSEARCH_VERSION.deb
ENV ELASTICSEARCH_VOLUME_DATA_STORAGE /usr/share/elasticsearch/data
ENV PATH /usr/share/elasticsearch/bin:$PATH

RUN groupadd -r elasticsearch && useradd -r -g elasticsearch elasticsearch

WORKDIR /usr/share/elasticsearch

# Get Elasticsearch
RUN set -e \
	&& curl -# "$ELASTICSEARCH_DEB_URL" -o /elasticsearch.deb \
	&& dpkg -i /elasticsearch.deb \
	&& rm /elasticsearch.deb*

RUN mkdir -p $ELASTICSEARCH_VOLUME_DATA_STORAGE ./logs ./config ./config/scripts \
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
