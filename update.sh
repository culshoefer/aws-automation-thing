#!/bin/bash

source /venv/bin/activate
cd ref_manager
pip install --upgrade pip
python manage.py makemigrations
python manage.py migrate
yes yes | python manage.py collectstatic
sudo systemctl restart nginx
exit 0
