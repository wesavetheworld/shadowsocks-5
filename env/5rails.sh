#!/bin/bash
sudo apt-get update
sudo apt-get install -y nodejs
gem install rails
rbenv rehash
rails -v