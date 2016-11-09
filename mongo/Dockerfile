FROM phusion/baseimage

MAINTAINER segabriel <sergiy.gabriel@gmail.com>

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd -r mongodb && useradd -r -g mongodb mongodb

ENV MONGO_VERSION 3.3.15
ENV MONGO_TGZ_URL https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-$MONGO_VERSION.tgz

# Get Mongo
RUN set -e \
	&& curl -# "$MONGO_TGZ_URL" -o /mongo.tgz \
	&& tar -zxf /mongo.tgz -C / \
	&& mv /mongodb-linux-x86_64-$MONGO_VERSION /mongodb
	#&& rm /mongo.tgz*

WORKDIR /mongodb

RUN mkdir -p /data/db /data/configdb \
	&& chown -R mongodb:mongodb /data/db /data/configdb

ENV PATH /mongodb/bin:$PATH

VOLUME /data/db /data/configdb

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 27017

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/sbin/my_init", "mongod"]
