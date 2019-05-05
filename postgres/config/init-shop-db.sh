#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    \set db `echo $SHOP_DB`
    \set user `echo $SHOP_DB_USER`
    \set password `echo $SHOP_DB_PASSWORD`
    CREATE USER :user WITH PASSWORD ':password';
    SELECT 'CREATE DATABASE :db'
    WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = ':db')\gexec
	CREATE EXTENSION IF NOT EXISTS hstore;
    GRANT ALL PRIVILEGES ON DATABASE :db TO :user;
EOSQL
