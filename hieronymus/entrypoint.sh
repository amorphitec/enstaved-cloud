#!/usr/bin/env bash

# Configuration defaults - override these using -e, --env=[] or --env-file=[]
# as described in https://docs.docker.com/reference/commandline/run/.
set -e
:   ${LOG_DIR:="/log"}

# Create and tail log files
mkdir -p $LOG_DIR
touch $LOG_DIR/gunicorn.log
touch $LOG_DIR/access.log
touch $LOG_DIR/error.log
tail -F $LOG_DIR/{gunicorn.log,access.log,error.log} --max-unchanged-stats=5 &

# Start Gunicorn.
exec gunicorn hieronymus.hieronymus:app \
    --name hieronymus \
    --bind 0.0.0.0:80 \
    --workers 3 \
    --log-level=info \
    --log-file=${LOG_DIR}/gunicorn.log \
    --access-logfile=${LOG_DIR}/access.log \
    --error-logfile=${LOG_DIR}/error.log \
    "$@"
