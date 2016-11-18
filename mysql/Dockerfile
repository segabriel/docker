FROM segabriel/baseimage

MAINTAINER segabriel <sergiy.gabriel@gmail.com>

ENV MYSQL_VERSION 5.7

RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN { \
		echo mysql-community-server mysql-community-server/data-dir select ''; \
		echo mysql-community-server mysql-community-server/root-pass password ''; \
		echo mysql-community-server mysql-community-server/re-root-pass password ''; \
		echo mysql-community-server mysql-community-server/remove-test-db select false; \
	} | debconf-set-selections \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server=$MYSQL_VERSION* \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /var/lib/mysql \
	&& mkdir -p /var/lib/mysql

COPY my.cnf /etc/mysql/my.cnf

RUN mkdir /etc/service/mysql
COPY start.sh /etc/service/mysql/run
RUN chmod +x /etc/service/mysql/run

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/sbin/my_init"]

EXPOSE 3306

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
