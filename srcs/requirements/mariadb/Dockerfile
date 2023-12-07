FROM debian:buster

ARG SQL_DATABASE
ARG SQL_USER
ARG SQL_PASSWORD
ARG SQL_ROOT_PASSWORD

RUN apt update -y && \
    apt upgrade -y && \
    apt install mariadb-server -y && \
    rm -rf /var/lib/apt/lists/*

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/init_mysql.sh /usr/local/bin/init_mysql.sh

# Exécuter le script après le démarrage du service MySQL
CMD service mysql start && /usr/local/bin/init_mysql.sh && mysqld_safe

EXPOSE 3306
