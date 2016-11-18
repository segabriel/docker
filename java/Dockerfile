FROM segabriel/baseimage

MAINTAINER segabriel <sergiy.gabriel@gmail.com>

RUN mkdir /usr/java
WORKDIR /usr/java

ENV JAVA_VER 1.8.0_102
ENV JAVA_DWL_VER 8u102
ENV JAVA_DWL_BVER b14
ENV JAVA_HOME ./current
ENV JDK_URL http://download.oracle.com/otn-pub/java/jdk/$JAVA_DWL_VER-$JAVA_DWL_BVER/jdk-$JAVA_DWL_VER-linux-x64.tar.gz
ENV JDK_HOME $JAVA_HOME
ENV PATH $JAVA_HOME/bin:$PATH

RUN curl -SL# --header "Cookie: oraclelicense=accept-securebackup-cookie" "$JDK_URL" -o ./jdk$JAVA_VER.tar.gz
RUN tar -zxf jdk$JAVA_VER.tar.gz -C ./ --no-same-owner --total \
    && rm jdk$JAVA_VER.tar.gz \
    && ln -sf ./jdk$JAVA_VER current \
    && chown -R root:root ./ \
    && chmod -R a+rwX ./

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/sbin/my_init", "/bin/bash"]
