FROM ubuntu
MAINTAINER antonio@tradingeconomics.com

# install requirements
ENV DEBIAN_FRONTEND noninteractive
RUN \
  apt-get update && \
  apt-get install -y python-software-properties software-properties-common curl nano

# install java
RUN \
  echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java7-installer

ENV JAVA_HOME /usr

ADD https://github.com/OpenTSDB/opentsdb/releases/download/v2.1.0RC1/opentsdb-2.1.0RC1_all.deb /tmp/opentsdb.deb
RUN dpkg -i /tmp/opentsdb.deb
RUN rm /tmp/opentsdb.deb

# For nano to work properly
ENV TERM=xterm

EXPOSE 4242

COPY start.sh start.sh
CMD ["/bin/sh", "start.sh"]
