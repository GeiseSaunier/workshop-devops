#!/bin/bash

NAME="django" 
PORT=${PORT:-80}     
RELOAD=${DEVELOPMENT_MODE:-false}
LOG_LEVEL=${LOG_LEVEL:-info}
NUM_WORKERS=${NUM_WORKERS:-4}                  # how many worker processes should Gunicorn spawn
WORKER_TIMEOUT=${WORKER_TIMEOUT:-60}           # Gunicorn worker timeout (in seconds)
NUM_THREADS=${NUM_THREADS:-2} 

echo "Starting $NAME as `whoami` in port $PORT"
date
echo "Gunicorn Workers: $NUM_WORKERS"
echo "Gunicorn Threads: $NUM_THREADS"
echo "Gunicorn Worker Timeout: $WORKER_TIMEOUT"
echo "Development Mode: $RELOAD"

# python manage.py collectstatic --no-input
python manage.py migrate

exec gunicorn config.wsgi \
  --name $NAME \
  --workers $NUM_WORKERS \
  --user root --group root \
  --bind 0.0.0.0:$PORT \
  --log-level debug \
  --timeout $WORKER_TIMEOUT \
  --threads $NUM_THREADS \
  `if [ $RELOAD == True ]; then echo "--reload"; fi`  # Optionally enable auto reload on source code changes