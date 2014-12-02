#!/bin/bash
rbenv install -s 2.1.5
rbenv global 2.1.5
ruby -v
echo 'gem: --no-ri --no-rdoc' > ~/.gemrc