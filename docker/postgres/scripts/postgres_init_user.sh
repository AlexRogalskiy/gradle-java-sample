#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

function initialize_db() {
  echo "Initializing default database <test> with user <test>"
  PGPASSWORD=$POSTGRES_PASSWORD /usr/bin/psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER test WITH SUPERUSER PASSWORD 'test';
    CREATE DATABASE test;
    GRANT ALL PRIVILEGES ON DATABASE test TO test;
EOSQL
}

initialize_db
