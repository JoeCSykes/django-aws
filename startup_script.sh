#! /bin/bash
DJANGO_SUPERUSER_PASSWORD=Admin890
DJANGO_SUPERUSER_USERNAME=admin
python3 manage.py migrate
python3 manage.py createsuperuser --no-input
