FROM segabriel/baseimage:0.9.22

MAINTAINER segabriel <sergiy.gabriel@gmail.com>

ENV JAVA_VER 1.8.0_144
ENV JAVA_DWL_VER 8u144
ENV JAVA_DWL_BVER b01
ENV JAVA_HOME /usr/java/current
ENV JDK_URL http://download.oracle.com/otn-pub/java/jdk/$JAVA_DWL_VER-$JAVA_DWL_BVER/090f390dda5b47b9b721c7dfaa008135/jdk-$JAVA_DWL_VER-linux-x64.tar.gz
ENV JDK_HOME $JAVA_HOME
ENV PATH $JAVA_HOME/bin:$PATH

WORKDIR /usr/java

RUN curl -SL# --header "Cookie: oraclelicense=accept-securebackup-cookie" "$JDK_URL" -o ./jdk$JAVA_VER.tar.gz \
	&& tar -zxf jdk$JAVA_VER.tar.gz -C ./ --no-same-owner --total \
    && rm jdk$JAVA_VER.tar.gz \
    && ln -sf ./jdk$JAVA_VER current \
    && chown -R root:root ./ \
    && chmod -R a+rwX ./ \
    && rm -rf /usr/java/jdk$JAVA_VER/*src.zip \
              /usr/java/jdk$JAVA_VER/lib/missioncontrol \
              /usr/java/jdk$JAVA_VER/lib/visualvm \
              /usr/java/jdk$JAVA_VER/lib/*javafx* \
              /usr/java/jdk$JAVA_VER/jre/plugin \
              /usr/java/jdk$JAVA_VER/jre/bin/javaws \
              /usr/java/jdk$JAVA_VER/jre/bin/jjs \
              /usr/java/jdk$JAVA_VER/jre/bin/orbd \
              /usr/java/jdk$JAVA_VER/jre/bin/pack200 \
              /usr/java/jdk$JAVA_VER/jre/bin/policytool \
              /usr/java/jdk$JAVA_VER/jre/bin/rmid \
              /usr/java/jdk$JAVA_VER/jre/bin/rmiregistry \
              /usr/java/jdk$JAVA_VER/jre/bin/servertool \
              /usr/java/jdk$JAVA_VER/jre/bin/tnameserv \
              /usr/java/jdk$JAVA_VER/jre/bin/unpack200 \
              /usr/java/jdk$JAVA_VER/jre/lib/javaws.jar \
              /usr/java/jdk$JAVA_VER/jre/lib/deploy* \
              /usr/java/jdk$JAVA_VER/jre/lib/desktop \
              /usr/java/jdk$JAVA_VER/jre/lib/*javafx* \
              /usr/java/jdk$JAVA_VER/jre/lib/*jfx* \
              /usr/java/jdk$JAVA_VER/jre/lib/amd64/libdecora_sse.so \
              /usr/java/jdk$JAVA_VER/jre/lib/amd64/libprism_*.so \
              /usr/java/jdk$JAVA_VER/jre/lib/amd64/libfxplugins.so \
              /usr/java/jdk$JAVA_VER/jre/lib/amd64/libglass.so \
              /usr/java/jdk$JAVA_VER/jre/lib/amd64/libgstreamer-lite.so \
              /usr/java/jdk$JAVA_VER/jre/lib/amd64/libjavafx*.so \
              /usr/java/jdk$JAVA_VER/jre/lib/amd64/libjfx*.so \
              /usr/java/jdk$JAVA_VER/jre/lib/ext/jfxrt.jar \
              /usr/java/jdk$JAVA_VER/jre/lib/ext/nashorn.jar \
              /usr/java/jdk$JAVA_VER/jre/lib/oblique-fonts \
              /usr/java/jdk$JAVA_VER/jre/lib/plugin.jar \
              /tmp/* /var/cache/apk/*

CMD ["/sbin/my_init", "/bin/bash"]

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
