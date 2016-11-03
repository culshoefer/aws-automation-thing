#!/bin/bash

cd ref_manager
source venv/bin/activate
venv/bin/python manage.py makemigrations
venv/bin/python manage.py migrate
yes yes | venv/bin/python manage.py collectstatic
deactivate
