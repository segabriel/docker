FROM phusion/baseimage

MAINTAINER segabriel <sergiy.gabriel@gmail.com>

ENV JAVA_VER=1.8.0_102 \
    JAVA_DWL_VER=8u102 \
    JAVA_DWL_BVER=b14 \
    JAVA_HOME=/usr/java/current
ENV JDK_HOME=${JAVA_HOME} \
    PATH=${JAVA_HOME}/bin:${PATH}

RUN mkdir /usr/java ; cd /usr/java ; \
    curl -fsSL --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/${JAVA_DWL_VER}-${JAVA_DWL_BVER}/jdk-${JAVA_DWL_VER}-linux-x64.tar.gz -o ./jdk${JAVA_VER}.tar.gz && \
    tar -zxf jdk${JAVA_VER}.tar.gz -C /usr/java/ --no-same-owner && rm jdk${JAVA_VER}.tar.gz && \
    ln -sf ./jdk${JAVA_VER} current && \
    chown -R root:root /usr/java && \
    chmod -R a+rwX /usr/java

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/sbin/my_init", "/bin/bash"]