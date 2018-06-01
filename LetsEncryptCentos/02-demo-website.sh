#!/bin/bash

# Remove the default nginx website and associated configs.
sudo rm -rf /var/www/html
sudo rm -rf /etc/nginx/sites-enabled/default /etc/nginx/sites-available/default \
            /etc/nginx/nginx.conf

# Copy over the demo website and make sure the www-data user owns it.
sudo cp -r ~/site/var/www/demo /var/www
sudo chown -R www-data:www-data /var/www/demo

# Copy over the demo website configs.
sudo cp ~/nginx/etc/nginx/sites-available/demo.conf /etc/nginx/sites-available
sudo cp ~/nginx/etc/nginx/nginx.conf /etc/nginx

# Symlink the demo config to activate it.
sudo ln -s /etc/nginx/sites-available/demo.conf /etc/nginx/sites-enabled

# Restart nginx because we changed the config files.
sudo service nginx restart
