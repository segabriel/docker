FROM segabriel/java:8

MAINTAINER segabriel <sergiy.gabriel@gmail.com>

ENV TOMCAT_MAJOR 8
ENV TOMCAT_VERSION 8.5.8
ENV TOMCAT_TGZ_URL https://www.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz
ENV CATALINA_HOME /opt/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

WORKDIR $CATALINA_HOME

# Get Tomcat
RUN set -e \
	&& curl -SL# "$TOMCAT_TGZ_URL" -o /tomcat.tar.gz \
	&& tar -zxf /tomcat.tar.gz --strip-components=1 -C ./ \
	&& rm ./bin/*.bat \
	&& rm /tomcat.tar.gz* \
	&& rm -rf $CATALINA_HOME/webapps/examples \
	&& rm -rf $CATALINA_HOME/webapps/docs

COPY ./conf $CATALINA_HOME/conf/
COPY ./lib $CATALINA_HOME/lib/
COPY ./webapps $CATALINA_HOME/webapps/

RUN mkdir /etc/service/tomcat
COPY start.sh /etc/service/tomcat/run
RUN chmod +x /etc/service/tomcat/run

COPY docker-entrypoint.sh /docker-tomcat-entrypoint.sh
RUN chmod +x /docker-tomcat-entrypoint.sh
ENTRYPOINT ["/docker-tomcat-entrypoint.sh"]

CMD ["/sbin/my_init"]

EXPOSE 8080

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
