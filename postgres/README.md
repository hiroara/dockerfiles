# dockerfiles/postgres

# Get started

    $ docker run -it --name db hiroara/postgres

and

    $ docker run -it --rm --link db:db postgres:9.3 /bin/bash -c "psql -h db -U \$DB_ENV_APP_USER -d \$DB_ENV_APP_DB_NAME"

    Password for user app: # input `app` ($APP_PASS is password encrypted by MD5)
    psql (9.3.5)
    Type "help" for help.

    app_development=>

# Importing existing data

And, you can import existing dump data from PostgreSQL.

    $ pg_dump -Fp app_development > postgres-dump.sql
    $ docker run -it --name db -v `pwd`:/local hiroara/postgres
