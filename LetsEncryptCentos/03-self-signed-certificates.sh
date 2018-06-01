#!/bin/bash

# Create a self signed SSL certificate.
sudo openssl req -new -newkey rsa:4096 -x509 -days 3650 -nodes \
             -subj /C=US/ST=NY/L=NY/O=NA/CN=localhost \
             -keyout /etc/ssl/insecure.key -out /etc/ssl/private/insecure.pem

# Create a DHParam file. Use 4096 bits instead of 2048 bits in production.
sudo openssl dhparam -out /etc/ssl/dhparam.pem 2048
