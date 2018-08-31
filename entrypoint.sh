#!/usr/bin/env bash

python manage.py migrate

gunicorn lappis.wsgi 0.0.0.0:80