FROM phusion/baseimage

MAINTAINER segabriel <sergiy.gabriel@gmail.com>

CMD ["/sbin/my_init"]

RUN groupadd -r mongodb && useradd -r -g mongodb mongodb

ENV MONGO_VERSION 3.3.15
ENV MONGO_TGZ_URL https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-$MONGO_VERSION.tgz

# Get Mongo
RUN set -e \
	&& curl -# "$MONGO_TGZ_URL" -o /mongo.tgz \
	&& tar -zxf /mongo.tgz -C / \
	&& mv /mongodb-linux-x86_64-$MONGO_VERSION /mongodb \
	&& rm /mongo.tgz*

WORKDIR /mongodb
ENV PATH /mongodb/bin:$PATH

RUN for path in /data/db /data/configdb ; do \
		mkdir -p "$path"; \
		chown -R mongodb:mongodb "$path"; \
	done

RUN mkdir /etc/service/mongodb
COPY start.sh /etc/service/mongodb/run
RUN chmod +x /etc/service/mongodb/run

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

VOLUME /data/db /data/configdb

EXPOSE 27017

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
