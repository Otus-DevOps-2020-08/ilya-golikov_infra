#!/bin/bash
set -e
APP_DIR=/opt
sudo apt-get install -y git
sudo git clone -b monolith https://github.com/express42/reddit.git $APP_DIR/reddit
cd $APP_DIR/reddit
sudo bundle install
