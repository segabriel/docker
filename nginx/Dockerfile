FROM segabriel/baseimage

MAINTAINER segabriel <sergiy.gabriel@gmail.com>

ENV NGINX_VERSION 1.11.6

WORKDIR /etc/nginx

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 > /dev/null 2>&1 \
	&& echo "deb http://nginx.org/packages/mainline/ubuntu/ xenial nginx" >> /etc/apt/sources.list \
	&& apt-get -qq update \
	&& apt-get install --no-install-recommends --no-install-suggests -yqq \
						ca-certificates \
						nginx=$NGINX_VERSION* \
						nginx-module-xslt \
						nginx-module-geoip \
						nginx-module-image-filter \
						nginx-module-perl \
						nginx-module-njs \
						gettext-base \
						> /dev/null 2>&1 \
	&& rm -rf /var/lib/apt/lists/*

COPY content /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf

RUN mkdir /etc/service/nginx
COPY start.sh /etc/service/nginx/run
RUN chmod +x /etc/service/nginx/run

COPY docker-entrypoint.sh /docker-nginx-entrypoint.sh
RUN chmod +x /docker-nginx-entrypoint.sh
ENTRYPOINT ["/docker-nginx-entrypoint.sh"]

CMD ["/sbin/my_init"]

EXPOSE 80 443

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
