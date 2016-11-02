#!/bin/bash

echo "Now installing all Python tools"

function virtualenv_dep_install {
    cd ref_manager
    if [ ! -d venv/bin ]; then
	virtualenv venv 
	echo "Created virtual environment"
    fi
    if [ ! -f venv/updated ]; then
	source venv/bin/activate
	pip install -r requirements.txt
	touch venv/updated
	echo "Installed python packages"
	deactivate
    fi
}

function virtualenv_install {
    echo "Installing virtualenv, it may ask for SUDO password"
    sudo pip install virtualenv
}

if [ ! -z `which virtualenv` ]; then
    virtualenv_install
fi

virtualenv_dep_install
echo "Now performing Django tasks"
pwd
source venv/bin/activate
venv/bin/python manage.py makemigrations
venv/bin/python manage.py migrate
yes yes | venv/bin/python manage.py collectstatic
deactivate
