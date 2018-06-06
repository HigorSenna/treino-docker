FROM debian:9

RUN apt update && \
    apt-get install -y mysql-server procps

ADD mysql-start.sh /bin/mysql-start.sh

RUN chmod a+x /bin/mysql-start.sh

CMD mysql-start.sh

