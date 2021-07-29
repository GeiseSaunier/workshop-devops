SHELL := /bin/bash # Use bash syntax
CURRENT_DIR := $(shell pwd)
SERVICE_NAME := django

# Database commands
migrations:
	docker-compose run --rm ${SERVICE_NAME} python manage.py makemigrations

migrate:
	docker-compose run --rm ${SERVICE_NAME} python manage.py migrate

db-flush:
	docker-compose run --rm ${SERVICE_NAME} python manage.py flush --noinput

db-reset:
	docker-compose run --rm	${SERVICE_NAME} python manage.py reset_db --noinput

test:
	docker-compose run --rm ${SERVICE_NAME} python manage.py test
