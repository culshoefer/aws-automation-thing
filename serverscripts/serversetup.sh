#!/bin/bash

# This script is for running the setup of NGINX, PostGreSQL
# We also call djangosetup.sh from here?

# Gunicorn setup
sudo cp srvr_conffiles/gunicorn.service /etc/systemd/system/gunicorn.service
sudo systemctl start gunicorn
sudo systemctl enable gunicorn
sudo systemctl daemon-reload
# Nginx setup

sudo cp srvr_conffiles/nginx_ref_manager /etc/nginx/sites-available/ref_manager
sudo ln -s /etc/nginx/sites-available/ref_manager /etc/nginx/sites-enabled
sudo systemctl restart nginx
sudo ufw allow 'Nginx Full'
