FROM debian:buster

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y wget \
      php7.3 \
      php-fpm \
	  php-mysql \
	  mariadb-client && \
    rm -rf /var/lib/apt/lists/*

# Change PHP config file
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Download and add wp clip permission
# (Invalid WP-CLI latest:update)
#RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN wget https://github.com/wp-cli/wp-cli-bundle/releases/download/v2.7.0/wp-cli-2.7.0.phar
RUN chmod +x wp-cli-2.7.0.phar
RUN mv wp-cli-2.7.0.phar /usr/local/bin/wp

COPY tools/wp_install.sh /var/

CMD ["bash", "/var/wp_install.sh"]

EXPOSE 9000