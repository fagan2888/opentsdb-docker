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

ADD https://github.com/ieconomics/opentsdb/blob/next/opentsdb.deb?raw=true /opt/opentsdb.deb
RUN dpkg -i /opt/opentsdb.deb

# For nano to work properly
ENV TERM=xterm

EXPOSE 4242

ADD start.sh /opt/start.sh
ADD start-tsdb.sh /opt/start-tsdb.sh
ADD create-tsdb-tables.sh /opt/create-tsdb-tables.sh

CMD ["/bin/sh", "/opt/start.sh"]
