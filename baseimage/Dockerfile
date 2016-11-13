FROM phusion/baseimage

MAINTAINER segabriel <sergiy.gabriel@gmail.com>

RUN apt-get -qq update && apt-get install -yqq mc --no-install-recommends > /dev/null \
	&& rm -rf /var/lib/apt/lists/*

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/sbin/my_init", "/bin/bash"]
