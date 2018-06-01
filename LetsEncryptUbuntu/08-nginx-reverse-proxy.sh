#!/bin/bash

# Back up the original demo file.
sudo mv /etc/nginx/conf.d/demo.conf \
        /etc/nginx/conf.d/demo-original.conf

# Override the old demo config with the reverse proxy config.
sudo cp ~/nginx/etc/nginx/conf.d/demo-reverse-proxy.conf \
     /etc/nginx/conf.d/demo.conf

# Start up a Python web server in the background.
cd /var/www/demo && python3 -m http.server 8000 &> /dev/null &

# Restart nginx because we changed a config file.
sudo systemctl restart nginx
