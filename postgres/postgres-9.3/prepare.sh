set -e

gosu postgres postgres --single -jE <<-EOSQL
  CREATE ROLE ${APP_USER} PASSWORD '${APP_PASS}' CREATEDB LOGIN;
EOSQL
gosu postgres postgres --single -jE <<-EOSQL
  CREATE DATABASE ${APP_DB_NAME} ENCODING '${APP_DB_ENCODING}' TEMPLATE template0;
EOSQL

echo host all ${APP_USER} 0.0.0.0/0 md5 >> ${PGDATA}/pg_hba.conf

DUMP_FILE=/local/postgres-dump.sql

if [ -f ${DUMP_FILE} ]; then
  echo === Now restoring... ===
  gosu postgres postgres &
  PID=$!
  while ! echo exit | nc localhost 5432; do sleep 1; done
  gosu postgres psql -a ${APP_DB_NAME} -f ${DUMP_FILE}
  kill -INT $PID
  while kill -0 $PID 2> /dev/null; do sleep 1; done
  echo === Restore has been completed. ===
else
  echo === No dump file \(${DUMP_FILE}\) ===
fi
