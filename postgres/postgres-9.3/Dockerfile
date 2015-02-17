FROM postgres:9.3

ENV APP_USER app
ENV APP_PASS md5fe63fea7be31b0200b496d08bc6b517d
ENV APP_DB_NAME app_development
ENV APP_DB_ENCODING UTF-8
ENV APP_DB_LOCALE en_US

RUN apt-get update && apt-get install -y netcat-openbsd
RUN locale-gen ${APP_DB_LOCALE} && locale-gen ${APP_DB_LOCALE}.${APP_DB_ENCODING}

ADD prepare.sh /docker-entrypoint-initdb.d/prepare.sh
