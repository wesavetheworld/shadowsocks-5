#!/bin/bash
# osc="precise"
# if [ -n "$1" ]; then
#   osc=$1
# fi
# sudo apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A
# sudo sh -c "echo 'deb http://repo.percona.com/apt $osc main\ndeb-src http://repo.percona.com/apt $osc main' > /etc/apt/sources.list.d/percona.list"
# sudo chown root: /etc/apt/sources.list.d/percona.list
# sudo chmod 600 /etc/apt/sources.list.d/percona.list
# sudo apt-get update
# sudo apt-get install -y percona-server-client-5.6 percona-server-server-5.6 libmysqlclient-dev
sudo apt-get install mysql-server mysql-client libmysqlclient-dev