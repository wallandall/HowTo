#!/bin/bash

# Copy over the hello website and make sure the www-data user owns it.
sudo cp -r ~/site/var/www/hello /var/www
sudo chown -R ngnix:nginx /var/www/hello

# Duplicate the demo config as a new hello config file.
sudo cp /etc/nginx/conf.d/demo.conf \
     /etc/nginx/conf.d/hello.conf

# You need to restart nginx after modifying your hello config file.
