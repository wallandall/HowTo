#!/bin/bash

# Create the Let's Encrypt / ACME challenge path.
sudo mkdir -p /var/www/letsencrypt/.well-known/acme-challenge

# Copy over the Let's Encrypt SSL enabled demo config.
sudo cp ~/nginx/etc/nginx/conf.d/demo-lets-encrypt-ssl.conf \
     /etc/nginx/conf.d/demo.conf

# Restart nginx because we changed a config file.
sudo systemctl restart nginx
