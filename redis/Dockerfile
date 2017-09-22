FROM segabriel/baseimage:0.9.22

MAINTAINER segabriel <sergiy.gabriel@gmail.com>

ENV REDIS_VERSION 4.0.2
ENV REDIS_DOWNLOAD_URL http://download.redis.io/releases/redis-$REDIS_VERSION.tar.gz
ENV REDIS_DATA_STORAGE /var/lib/redis
ENV REDIS_LOG_STORAGE /var/log/redis
ENV REDIS_CONFIG /etc/redis/redis.conf

RUN groupadd -r redis && useradd -r -g redis redis

WORKDIR /etc/redis

# Get Redis
RUN set -e \
	&& buildDeps='gcc libc6-dev make' \
	&& apt-get update > /dev/null 2>&1 \
	&& apt-get install -y $buildDeps --no-install-recommends > /dev/null 2>&1 \
	&& rm -rf /var/lib/apt/lists/* \
	&& curl -SL# "$REDIS_DOWNLOAD_URL" -o redis.tar.gz \
	&& mkdir -p /usr/src/redis \
	&& tar -zxf redis.tar.gz -C /usr/src/redis --strip-components=1 \
	&& rm redis.tar.gz \
	&& grep -q '^#define CONFIG_DEFAULT_PROTECTED_MODE 1$' /usr/src/redis/src/server.h \
	&& sed -ri 's!^(#define CONFIG_DEFAULT_PROTECTED_MODE) 1$!\1 0!' /usr/src/redis/src/server.h \
	&& grep -q '^#define CONFIG_DEFAULT_PROTECTED_MODE 0$' /usr/src/redis/src/server.h \
	&& make -C /usr/src/redis > /dev/null 2>&1 \
	&& make -C /usr/src/redis install > /dev/null 2>&1 \
	&& rm -r /usr/src/redis \
	&& apt-get purge -y --auto-remove $buildDeps > /dev/null 2>&1

COPY redis.conf /etc/redis/redis.conf

RUN mkdir /etc/service/redis
COPY start.sh /etc/service/redis/run
RUN chmod +x /etc/service/redis/run

COPY docker-entrypoint.sh /docker-redis-entrypoint.sh
RUN chmod +x /docker-redis-entrypoint.sh
ENTRYPOINT ["/docker-redis-entrypoint.sh"]

CMD ["/sbin/my_init"]

EXPOSE 6379

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
