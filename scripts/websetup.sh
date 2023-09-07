#! /bin/bash

yum install wget unzip httpd -y

sudo systemctl start httpd
sudo systemctl enable httpd
mkdir -p /tmp/webfiles
cd /tmp/webfiles

wget https://www.tooplate.com/zip-templates/2136_kool_form_pack.zip

unzip 2136_kool_form_pack.zip
sudo cp -r 2136_kool_form_pack/* /var/www/html

systemctl restart httpd

rm -rf /tmp/webfiles