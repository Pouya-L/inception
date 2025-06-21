FROM debian:buster

# Set environment variables to prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && \
    apt-get install -y mariadb-server procps && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql

COPY tools/entrypoint.sh /entrypoint.sh
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/


# Make sure it is executable
RUN chmod +x /entrypoint.sh

# Expose default MariaDB port
EXPOSE 3306

# Set entrypoint to your custom script
ENTRYPOINT ["bash", "-c", "/entrypoint.sh"]
