#!/bin/bash

# Stop nginx to avoid a port conflict.
sudo service nginx stop

# Update the package list and install apache2.
sudo apt-get update
sudo apt-get install apache2 -y

# Enable a few standard mods.
sudo a2enmod ssl rewrite headers expires
sudo service apache2 restart

# Remove the default apache2 website and associated configs.
sudo rm -rf /var/www/html
sudo rm -rf /etc/apache2/sites-enabled/000-default.conf \
            /etc/apache2/sites-available/000-default.conf \
            /etc/apache2/sites-available/default-ssl.conf

# Create the Let's Encrypt / ACME challenge path.
sudo mkdir -p /var/www/letsencrypt/.well-known/acme-challenge

# Copy over the SSL config.
sudo cp ~/apache/etc/apache2/conf-available/ssl.conf \
        /etc/apache2/conf-available

# Symlink the demo config to activate it.
sudo ln -s /etc/apache2/conf-available/ssl.conf /etc/apache2/conf-enabled

# Copy over the Let's Encrypt SSL enabled demo config.
sudo cp ~/apache/etc/apache2/sites-available/demo-lets-encrypt-ssl.conf \
        /etc/apache2/sites-available/demo.conf

# Symlink the demo config to activate it.
sudo ln -s /etc/apache2/sites-available/demo.conf /etc/apache2/sites-enabled

# You need to restart apache2 after modifying the demo config.
