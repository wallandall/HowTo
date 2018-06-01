#!/bin/bash

# Copy over the SSL enabled demo config.
sudo cp ~/nginx/etc/nginx/sites-available/demo-ssl.conf \
        /etc/nginx/sites-available/demo.conf

# Restart nginx because we changed a config file.
sudo service nginx restart
