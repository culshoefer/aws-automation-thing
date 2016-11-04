#!/bin/bash

cd ref_manager
source env/bin/activate
env/bin/python manage.py makemigrations
env/bin/python manage.py migrate
yes yes | env/bin/python manage.py collectstatic
deactivate
exit 0
