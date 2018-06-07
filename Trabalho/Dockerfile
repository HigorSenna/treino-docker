FROM debian:9

RUN apt update && \
    apt-get install -y mysql-server procps apache2 php php-mysqli

ADD configurar-servicos.sh /bin/configurar-servicos.sh
ADD GLPI.sql /opt/GLPI.sql 

RUN chmod a+x /bin/configurar-servicos.sh && chmod a+x /opt/GLPI.sql && chmod -R 777 /var/lib/mysql

CMD configurar-servicos.sh

