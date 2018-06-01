#!/bin/bash

# Remove the default nginx website and associated configs.
sudo rm -rf /usr/share/nginx/html
sudo rm -rf /etc/nginx/conf.d/default /etc/nginx/conf.d/default \
            /etc/nginx/nginx.conf

# Copy over the demo website and make sure the nginx user owns it.
sudo mkdir -p /var/www
sudo cp -r ~/site/var/www/demo /var/www
sudo chown -R nginx:nginx /var/www/demo

# Copy over the demo website configs.
sudo cp ~/nginx/etc/nginx/conf.d/demo.conf /etc/nginx/conf.d
sudo cp ~/nginx/etc/nginx/nginx.conf /etc/nginx

# Restart nginx because we changed the config files.
sudo systemctl restart nginx
