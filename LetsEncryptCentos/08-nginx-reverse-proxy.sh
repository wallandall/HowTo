#!/bin/bash

# Back up the original demo file.
sudo mv /etc/nginx/sites-available/demo.conf \
        /etc/nginx/sites-available/demo-original.conf

# Override the old demo config with the reverse proxy config.
sudo cp ~/nginx/etc/nginx/sites-available/demo-reverse-proxy.conf \
     /etc/nginx/sites-available/demo.conf

# Start up a Python web server in the background.
cd /var/www/demo && python3 -m http.server 8000 &> /dev/null &

# Restart nginx because we changed a config file.
sudo service nginx restart
