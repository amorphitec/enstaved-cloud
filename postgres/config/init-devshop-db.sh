#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    \set db `echo $DEVSHOP_DB`
    \set user `echo $DEVSHOP_DB_USER`
    \set password `echo $DEVSHOP_DB_PASSWORD`
    CREATE USER :user WITH PASSWORD ':password';
    CREATE DATABASE :db;
    GRANT ALL PRIVILEGES ON DATABASE :db TO :user;
EOSQL

psql -v ON_ERROR_STOP=1 -U $POSTGRES_USER -d $DEVSHOP_DB -v -c "CREATE EXTENSION IF NOT EXISTS hstore"
psql -v ON_ERROR_STOP=1 -U $POSTGRES_USER -d $DEVSHOP_DB -v -c "CREATE EXTENSION IF NOT EXISTS pg_trgm"
psql -v ON_ERROR_STOP=1 -U $POSTGRES_USER -d $DEVSHOP_DB -v -c "CREATE EXTENSION IF NOT EXISTS btree_gin"

