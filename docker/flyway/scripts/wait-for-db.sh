#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

db_host="$1"
shift
db_port="$1"
shift
db_name="$1"
shift
db_retry="$1"
shift
cmd="$@"

until PGPASSWORD=$FLYWAY_PASSWORD /usr/bin/psql --quiet --host "$db_host" --port "$db_port" --dbname "$db_name" --username "$FLYWAY_USER" --command "SELECT 1;" >/dev/null 2>&1 || [ $db_retry -eq 0 ]; do
  echo "==> $(date): Retry #$((db_retry -= 1)) while connecting to database <$db_name> on host <$db_host> with port <$db_port>..."
  sleep 1
done

echo "Database <"$db_name"> on host <$db_host> with port <$db_port> is up and running"
exec $cmd
