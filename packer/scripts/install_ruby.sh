#!/bin/bash

echo "Run install_ruby.sh"
# Install ruby and bundler
echo "Install ruby"
apt-get update &> /dev/null
sleep 5
apt-get install -y ruby-full ruby-bundler build-essential &> /dev/null
echo "OK"
