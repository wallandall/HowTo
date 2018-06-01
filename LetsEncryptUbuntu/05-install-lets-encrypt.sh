#!/bin/bash

# Copy over Let's Encrypt related scripts and make them executable.
sudo cp ~/lets-encrypt/usr/local/bin/* /usr/local/bin
sudo chmod +x /usr/local/bin/acme-tiny.py /usr/local/bin/issue-certificate.sh
