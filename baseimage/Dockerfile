FROM phusion/baseimage:0.9.22

MAINTAINER segabriel <sergiy.gabriel@gmail.com>

ENV TERM xterm

RUN apt-get -qq update && apt-get install -yqq mc --no-install-recommends > /dev/null 2>&1 \
	&& rm -rf /var/lib/apt/lists/*

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/sbin/my_init", "/bin/bash"]
