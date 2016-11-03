#!/bin/bash

source /venv/bin/activate
cd ref_manager
python manage.py makemigrations
python manage.py migrate
yes yes | python manage.py collectstatic
sudo systemctl restart nginx
