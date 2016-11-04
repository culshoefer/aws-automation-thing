#!/bin/bash

source ../env/bin/activate
pwd
cd ref_manager
pwd
pip install --upgrade pip
python manage.py makemigrations
python manage.py migrate
yes yes | python manage.py collectstatic
sudo systemctl restart nginx
deactivate
exit 0
