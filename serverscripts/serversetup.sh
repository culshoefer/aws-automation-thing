#!/bin/bash

# This script is for running the setup of NGINX, PostGreSQL
# We also call djangosetup.sh from here

sudo apt-get update
yes yes | sudo apt-get install python-pip python-dev libpq-dev postgresql postgresql-contrib nginx systemctl ufw
# Gunicorn setup
cp srvr_conffiles/gunicorn.service /etc/sysctl.d/system/gunicorn.service
sudo systemctl start gunicorn
sudo systemctl enable gunicorn

# Nginx setup

cp srvr_conffiles/nginx_ref_manager /etc/nginx/sites-available/ref_manager /etc/nginx/sites-enabled
sudo sysctl restart nginx
sudo ufw allow 'Nginx Full'
