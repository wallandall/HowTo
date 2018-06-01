#!/bin/bash

# Create a private certificate directory.
sudo mkdir -p /etc/ssl/private

# Create a self signed SSL certificate.
sudo openssl req -new -newkey rsa:4096 -x509 -days 3650 -nodes \
             -subj /C=US/ST=NY/L=NY/O=NA/CN=localhost \
             -keyout /etc/ssl/insecure.key -out /etc/ssl/private/insecure.pem

# Create a DHParam file. Use 4096 bits instead of 2048 bits in production.
sudo openssl dhparam -out /etc/ssl/dhparam.pem 2048

# Append the dhparam file into the pem file. You only need to do this if you
# are planning to use an old version of Apache on CentOS. Simply uncomment this
# line to enable this behavior.
#
# An explanation of why this is necessary is in the `ssl.conf` file located in
# src/apache/etc/httpd/conf.d/ssl.conf supplied with this course.
#
# cat /etc/ssl/dhparam.pem | sudo tee -a /etc/ssl/private/insecure.pem
