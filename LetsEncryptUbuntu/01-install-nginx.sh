#!/bin/bash

# Enable the CentOS 7 EPEL repository and install nginx.
sudo yum install epel-release -y
sudo yum install nginx -y

# Start nginx and also auto-start on system boot.
sudo systemctl start nginx
sudo systemctl enable nginx
