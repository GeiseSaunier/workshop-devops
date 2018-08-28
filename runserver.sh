#!/usr/bin/env bash


python3 manage.py migrate

echo "Server running"
gunicorn lappis.wsgi -b 0.0.0.0:80