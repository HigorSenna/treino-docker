#!/bin/bash

echo "iniciando mysql"

service mysql start 

mysql -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root');flush privileges;update mysql.user set plugin=null where user='root';flush privileges;" && echo "restaurando banco.."

mysql -u root -proot -e "source /opt/GLPI.sql" 

echo "iniciando apache"  && service apache2 start

status=$(pgrep mysqld)
if [ -z "$status" ]; then
  echo "Falha ao iniciar o mysql: $status"
  exit $status
fi

while sleep 60; do
  status=$(pgrep mysqld)
  if [ -z "$status" ]; then
    echo "O Processo Terminou."
    exit 1
  fi
done
