FROM segabriel/baseimage:0.9.22

MAINTAINER segabriel <sergiy.gabriel@gmail.com>

ENV MYSQL_VERSION 5.7
ENV MYSQL_VOLUME_HOME /var/lib/mysql

RUN groupadd -r mysql && useradd -r -g mysql mysql

WORKDIR /etc/mysql

RUN { \
		echo mysql-community-server mysql-community-server/data-dir select ''; \
		echo mysql-community-server mysql-community-server/root-pass password ''; \
		echo mysql-community-server mysql-community-server/re-root-pass password ''; \
		echo mysql-community-server mysql-community-server/remove-test-db select false; \
	} | debconf-set-selections \
	&& apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get install -yqq mysql-server=$MYSQL_VERSION* --no-install-recommends > /dev/null 2>&1 \
	&& rm -rf /var/lib/apt/lists/* && rm -rf /var/lib/mysql \
	&& mkdir -p $MYSQL_VOLUME_HOME && chown -R mysql:mysql $MYSQL_VOLUME_HOME \
	&& mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld

COPY my.cnf /etc/mysql/my.cnf

RUN mkdir /etc/service/mysql
COPY start.sh /etc/service/mysql/run
RUN chmod +x /etc/service/mysql/run

COPY docker-entrypoint.sh /docker-mysql-entrypoint.sh
RUN chmod +x /docker-mysql-entrypoint.sh
ENTRYPOINT ["/docker-mysql-entrypoint.sh"]

CMD ["/sbin/my_init"]

EXPOSE 3306

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
