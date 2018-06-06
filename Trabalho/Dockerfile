FROM debian:9

RUN apt update && \
    apt-get install -y mysql-server procps

ADD mysql-start.sh /bin/mysql-start.sh
ADD GLPI.sql /opt/GLPI.sql 

RUN chmod a+x /bin/mysql-start.sh && chmod a+x /opt/GLPI.sql

CMD mysql-start.sh

