#!/bin/bash

# Copy over the SSL enabled demo config.
sudo cp ~/nginx/etc/nginx/conf.d/demo-ssl.conf \
        /etc/nginx/conf.d/demo.conf

# Restart nginx because we changed a config file.
sudo systemctl restart nginx
