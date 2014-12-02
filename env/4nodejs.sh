#!/usr/bin/expect -f
spawn sudo add-apt-repository ppa:chris-lea/node.js
expect "* to continue or ctrl-c to cancel adding it"
send "\r"
interact