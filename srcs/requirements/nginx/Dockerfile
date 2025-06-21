FROM debian:buster

ENV DEBIAN_FRONTEND=noninteractive

# Install NGINX and OpenSSL
RUN apt-get update && \
    apt-get install -y nginx openssl procps && \
    rm -rf /var/lib/apt/lists/*

# Create self-signed certificate
RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/selfsigned.key \
    -out /etc/nginx/ssl/selfsigned.crt \
    -subj "/C=PT/ST=Lisbon/L=Lisbon/O=42/OU=Inception/CN=plashkar"

# Copy WordPress site config
COPY conf/default.conf /etc/nginx/conf.d/default.conf

# Expose HTTPS port
EXPOSE 443

# Start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
