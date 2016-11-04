#!/bin/bash

source ../env/bin/activate
cd aws-automation-thing/ref_manager
pip install --upgrade pip
python manage.py makemigrations
python manage.py migrate
yes yes | python manage.py collectstatic
sudo systemctl restart nginx
deactivate
exit 0
