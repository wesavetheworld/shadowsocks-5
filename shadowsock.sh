#!/bin/bash
sudo apt-get update
sudo apt-get install -y python-pip python-m2crypto supervisor
sudo pip install shadowsocks
sudo sh -c "echo '{\n    \"server\": \"0.0.0.0\",\n    \"server_port\": 8888,\n    \"local_address\": \"127.0.0.1\",\n    \"local_port\": 1080,\n    \"password\": \"123456\",\n    \"timeout\": 300,\n    \"method\": \"aes-256-cfb\",\n    \"fast_open\": false,\n    \"workers\": 1\n}' > /etc/shadowsocks.json"
sudo sh -c "echo '[program:shadowsocks]\ncommand=ssserver -c /etc/shadowsocks.json\nautorestart=true\nuser=nobody' > /etc/supervisor/conf.d/shadowsocks.conf"
sudo sh -c "echo 'ulimit -n 51200' >> /etc/default/supervisor"
sudo service supervisor start
sudo supervisorctl reload
netstat -nat