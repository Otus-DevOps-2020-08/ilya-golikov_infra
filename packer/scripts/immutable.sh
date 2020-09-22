#!/bin/bash

echo "Run $0"

# install git
echo "Install git"
apt-get install -y git &> /dev/null
echo "OK"
# create user puma
echo "Create user puma"
useradd puma -d /opt/reddit
echo "OK"
# clone repo
echo "Install reddit app"
git clone -b monolith https://github.com/express42/reddit.git /opt/reddit &> /dev/null
echo "OK"
# set /opt/reddit owner
chown -hR puma:puma /opt/reddit
# install dependencies
echo "Install reddit dependencies"
pushd /opt/reddit &> /dev/null
sudo -u ubuntu bundle install &> /dev/null
popd &> /dev/null
echo "OK"
# create puma.service
echo "Create puma systemd unit"
cat > /tmp/puma.service << EOF
[Unit]
Description=Puma HTTP Server
After=network.target

[Service]
Type=simple
User=puma
WorkingDirectory=/opt/reddit
ExecStart=/usr/local/bin/puma
Restart=always

[Install]
WantedBy=multi-user.target
EOF
# copy service file
mv /tmp/puma.service /lib/systemd/system/puma.service
echo "OK"
# Start puma
echo "Enabling puma service"
systemctl daemon-reload
systemctl enable puma &> /dev/null
echo "Done"
