#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    \set db `echo $DEVSHOP_DB`
    \set user `echo $DEVSHOP_DB_USER`
    \set password `echo $DEVSHOP_DB_PASSWORD`
    CREATE USER :user WITH PASSWORD ':password';
    CREATE DATABASE :db;
	CREATE EXTENSION IF NOT EXISTS hstore;
    GRANT ALL PRIVILEGES ON DATABASE :db TO :user;
EOSQL
