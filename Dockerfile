FROM ieconomics/ubuntu-docker
MAINTAINER antonio@tradingeconomics.com

ADD https://github.com/ieconomics/opentsdb/blob/next/opentsdb.deb?raw=true /opt/opentsdb.deb
RUN dpkg -i /opt/opentsdb.deb

EXPOSE 4242

ADD supervisord.conf /etc/supervisord.conf

CMD ["supervisord", "-c", "/etc/supervisord.conf"]
