FROM debian:buster

ENV DEBIAN_FRONTEND=noninteractive

# Copy setup script
COPY tools/setup.sh /setup.sh
RUN chmod +x /setup.sh

# Install PHP, extensions, curl, wget, and unzip
RUN apt-get update && \
    apt-get install -y php php-fpm php-mysql curl wget unzip default-mysql-client procps && \
    rm -rf /var/lib/apt/lists/*

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp


# Download and extract WordPress
RUN mkdir -p /var/www/html && \
    curl -O https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    cp -r wordpress/* /var/www/html && \
    rm -rf latest.tar.gz wordpress && \
    chown -R www-data:www-data /var/www/html

# This replaces the default listen = /run/php/php7.3-fpm.sock with listen = 9000
RUN sed -i "s|^listen = .*|listen = 9000|" /etc/php/7.3/fpm/pool.d/www.conf

# Expose PHP-FPM port
EXPOSE 9000

# Entrypoint
ENTRYPOINT ["bash", "-c", "/setup.sh"]
