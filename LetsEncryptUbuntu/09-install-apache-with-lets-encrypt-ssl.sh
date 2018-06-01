#!/bin/bash

# Stop nginx to avoid a port conflict.
#
# This is just for now. If you really want to get rid of it, you'll want to
# uninstall it with yum (example: yum remove nginx -y)
sudo systemctl stop nginx

# Update the package list and install httpd (Apache).
sudo yum install epel-release -y
sudo yum install httpd -y

# Enable SSL.
sudo yum install mod_ssl -y

# Remove the default httpd website and associated configs.
sudo rm -rf /usr/share/httpd
sudo rm -rf /etc/httpd/conf.d/welcome.conf

# Create the Let's Encrypt / ACME challenge path.
sudo mkdir -p /var/www/letsencrypt/.well-known/acme-challenge

# Copy over the SSL config.
sudo cp ~/apache/etc/httpd/conf.d/ssl.conf \
        /etc/httpd/conf.d

# Copy over the Let's Encrypt SSL enabled demo config.
sudo cp ~/apache/etc/httpd/conf.d/demo-lets-encrypt-ssl.conf \
        /etc/httpd/conf.d/demo.conf

# Start httpd and also auto-start on system boot.
sudo systemctl start httpd
sudo systemctl enable httpd
