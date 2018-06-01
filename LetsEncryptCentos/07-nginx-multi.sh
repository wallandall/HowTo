#!/bin/bash

# Copy over the hello website and make sure the www-data user owns it.
sudo cp -r ~/site/var/www/hello /var/www
sudo chown -R www-data:www-data /var/www/hello

# Duplicate the demo config as a new hello config file.
sudo cp /etc/nginx/sites-available/demo.conf \
     /etc/nginx/sites-available/hello.conf

# Symlink the second demo config to activate it.
sudo ln -s /etc/nginx/sites-available/hello.conf /etc/nginx/sites-enabled

# You need to restart nginx after modifying your hello config file.
