#!/bin/bash

# This script is for running the setup of NGINX, PostGreSQL
# We also call djangosetup.sh from here

sudo apt-get update
sudo apt-get install python-pip python-dev libpq-dev postgresql postgresql-contrib nginx

source ./djangosetup.sh
