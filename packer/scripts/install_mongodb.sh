#!/bin/bash
echo "Run install_mongodb.sh"

# Install apt https transport and ca-certs
echo "Install dependencies"
apt-get install -y apt-transport-https ca-certificates &> /dev/null
echo "OK"
# Get repository key
echo "Add mongodb repository"
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc  | apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.2.list
echo "OK"
# Install Mondgodb
echo "Install mongodb"
apt-get update &> /dev/null
apt-get install -y mongodb-org &> /dev/null
echo "OK"
# Enable and start mongod servive
echo "Enable and start mongodb service"
systemctl start mongod &> /dev/null
systemctl enable mongod &> /dev/null
echo "OK"
