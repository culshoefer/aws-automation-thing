#!/bin/bash

cd ../
source env/bin/activate
env/bin/python aws-automation-thing/ref_manager/manage.py makemigrations
env/bin/python aws-automation-thing/ref_manager/manage.py migrate
yes yes | env/bin/python aws-automation-thing/ref_manager/manage.py collectstatic
deactivate
exit 0
