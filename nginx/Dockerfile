FROM phusion/baseimage

MAINTAINER segabriel <sergiy.gabriel@gmail.com>

CMD ["/sbin/my_init"]

ENV NGINX_VERSION 1.11.5

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
	&& echo "deb http://nginx.org/packages/mainline/ubuntu/ xenial nginx" >> /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y \
						ca-certificates \
						nginx=${NGINX_VERSION} \
						nginx-module-xslt \
						nginx-module-geoip \
						nginx-module-image-filter \
						nginx-module-perl \
						nginx-module-njs \
						gettext-base \
	&& rm -rf /var/lib/apt/lists/*

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

#RUN rm -Rf /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]





# How to run
#
# mkdir -p /srv/docker/nginx_in/etc
# mkdir -p /srv/docker/nginx_in/log
#
# docker run -d --name nginx_in -h nginx_in \
#	-v /srv/docker/nginx_in/log:/var/log/nginx:rw \
#	-v /srv/docker/nginx_in/etc/nginx:/etc/nginx/:ro \
#	-p 80:80 \
#	-p 443:443 \
#	hyber_nginx:centos7