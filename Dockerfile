FROM ubuntu-14.01
MAINTAINER  Jeff Destine 'jeff@namely.com'
RUN apt-get update -qy
RUN apt-get install -qy open-jdk-7-jdk
ADD ./elasticsearch-1.3.4.deb /opt
WORKDIR [/opt]
RUN dpkg -i *.deb
VOLUME /var/lib/elasticsearch
USER elasticsearch
CMD source /etc/sysconfig/elasticsearch; /usr/share/elasticsearch/bin/elasticsearch -p /var/run/elasticsearch/elasticsearch.pid -Des.default.config=$CONF_FILE -Des.default.path.home=$ES_HOME -Des.default.path.logs=$LOG_DIR -Des.default.path.data=$DATA_DIR -Des.default.path.work=$WORK_DIR -Des.default.path.conf=$CONF_DIR
expose 9200
expose 9300

