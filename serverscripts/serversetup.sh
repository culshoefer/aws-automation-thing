#!/bin/bash

# This script is for running the setup of NGINX, PostGreSQL
# We also call djangosetup.sh from here

apt-get update
apt-get install python-pip python-dev libpq-dev postgresql postgresql-contrib nginx

# Gunicorn setup
cp srvr_conffiles/gunicorn.service /etc/systemd/system/gunicorn.service
sudo systemctl start gunicorn
sudo systemctl enable gunicorn

# Nginx setup

cp srvr_conffiles/nginx_ref_manager /etc/nginx/sites-available/ref_manager /etc/nginx/sites-enabled
sudo systemctl restart nginx
sudo ufw allow 'Nginx Full'
