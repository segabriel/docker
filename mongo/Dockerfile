FROM segabriel/baseimage

MAINTAINER segabriel <sergiy.gabriel@gmail.com>

ENV MONGO_VERSION 3.3.15
ENV MONGO_TGZ_URL https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-$MONGO_VERSION.tgz
ENV MONGO_VOLUME_DATA_STORAGE /data/db
ENV MONGO_VOLUME_DATA_CONFIG /data/configdb
ENV PATH /mongodb/bin:$PATH

RUN groupadd -r mongodb && useradd -r -g mongodb mongodb

WORKDIR /mongodb

# Get Mongo
RUN set -e \
	&& curl -SL# "$MONGO_TGZ_URL" -o /mongo.tgz \
	&& tar -zxf /mongo.tgz -C / \
	&& mv /mongodb-linux-x86_64-$MONGO_VERSION ./ \
	&& rm /mongo.tgz*

RUN mkdir -p $MONGO_VOLUME_DATA_STORAGE $MONGO_VOLUME_DATA_CONFIG \
	&& chown -R mongodb:mongodb $MONGO_VOLUME_DATA_STORAGE $MONGO_VOLUME_DATA_CONFIG

RUN mkdir /etc/service/mongodb
COPY start.sh /etc/service/mongodb/run
RUN chmod +x /etc/service/mongodb/run

COPY docker-entrypoint.sh /docker-mongo-entrypoint.sh
RUN chmod +x /docker-mongo-entrypoint.sh
ENTRYPOINT ["/docker-mongo-entrypoint.sh"]

CMD ["/sbin/my_init"]

EXPOSE 27017

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
