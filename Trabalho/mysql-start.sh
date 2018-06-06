#!/bin/bash

# Start the first process
service mysql start &&
mysql -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root');flush privileges;update mysql.user set plugin=null where user='root';flush privileges"

status=$(pgrep mysqld)
if [ -z "$status" ]; then
  echo "Falha ao iniciar o mysql: $status"
  exit $status
fi

# Naive check runs checks once a minute to see if either of the processes exited.
# This illustrates part of the heavy lifting you need to do if you want to run
# more than one service in a container. The container exits with an error
# if it detects that either of the processes has exited.
# Otherwise it loops forever, waking up every 60 seconds

while sleep 60; do
  status=$(pgrep mysqld)
  # ps aux |grep my_second_process |grep -q -v grep
  # PROCESS_2_STATUS=$?
  # If the greps above find anything, they exit with 0 status
  # If they are not both 0, then something is wrong
  if [ -z "$status" ]; then
    echo "O Processo Terminou."
    exit 1
  fi
done
