#!/usr/bin/env bash


python3 manage.py migrate

echo "Server running on localhost"
python3 manage.py runserver 0.0.0.0:8000