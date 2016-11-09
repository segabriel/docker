FROM segabriel/java:8

MAINTAINER segabriel <sergiy.gabriel@gmail.com>

ENV ELASTICSEARCH_VERSION 2.4.1
ENV ELASTICSEARCH_DEB_URL https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/$ELASTICSEARCH_VERSION/elasticsearch-$ELASTICSEARCH_VERSION.deb

# Get Elasticsearch
RUN set -e \
	&& curl -# "$ELASTICSEARCH_DEB_URL" -o /elasticsearch.deb \
	&& dpkg -i /elasticsearch.deb \
	&& rm /elasticsearch.deb*

ENV PATH /usr/share/elasticsearch/bin:$PATH

WORKDIR /usr/share/elasticsearch

RUN set -e \
	&& for path in ./data ./logs ./config ./config/scripts ; do \
		mkdir -p "$path"; \
		chown -R elasticsearch:elasticsearch "$path"; \
	done

COPY config ./config

VOLUME /usr/share/elasticsearch/data

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 9200 9300

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD /sbin/my_init

USER elasticsearch
CMD elasticsearch
