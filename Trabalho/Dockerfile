FROM debian:9

RUN apt update && \
    apt-get install -y mysql-server procps

ADD mysql-start.sh /bin/mysql-start.sh

RUN chmod a+x /bin/mysql-start.sh

ADD mysql-change-password.sh /bin/mysql-change-password.sh

#RUN chmod a+x /bin/mysql-change-password.sh

CMD mysql-start.sh

