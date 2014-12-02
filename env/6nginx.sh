#!/bin/bash
osc="precise"
if [ -n "$1" ]; then
  osc=$1
fi
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
sudo apt-get install -y apt-transport-https ca-certificates
sudo sh -c "echo 'deb https://oss-binaries.phusionpassenger.com/apt/passenger $osc main' > /etc/apt/sources.list.d/passenger.list"
sudo chown root: /etc/apt/sources.list.d/passenger.list
sudo chmod 600 /etc/apt/sources.list.d/passenger.list
sudo apt-get update
sudo apt-get install -y nginx-extras passenger