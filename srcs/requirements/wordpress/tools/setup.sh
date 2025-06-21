#!/bin/bash
set -e

echo "⏳ Waiting for MariaDB at $DB_HOSTNAME:$DB_PORT..."
until mysqladmin ping -h"$DB_HOSTNAME" -P"$DB_PORT" -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" --silent; do
    sleep 1
done

# Ensure /run/php exists
mkdir -p /run/php

# Go to WordPress directory
cd /var/www/html

# Step 1: Download WP if needed
if [ ! -f wp-load.php ]; then
    echo "📥 Downloading WordPress..."
    wp core download --allow-root
fi

# Step 2: Create wp-config.php if it doesn't exist
if [ ! -f wp-config.php ]; then
    echo "⚙️ Generating wp-config.php..."
    wp config create \
        --dbname="$MYSQL_DATABASE" \
        --dbuser="$MYSQL_USER" \
        --dbpass="$MYSQL_PASSWORD" \
        --dbhost="$DB_HOSTNAME:$DB_PORT" \
        --allow-root
fi

# Step 3: Install WP if not installed
if ! wp core is-installed --allow-root; then
    echo "🛠 Installing WordPress..."
    wp core install \
        --url="$WEBSITE_WP" \
        --title="$DOMAIN_NAME" \
        --admin_user="$ADMIN_WP" \
        --admin_password="$ADMIN_PS" \
        --admin_email="$ADMIN_EMAIL" \
        --skip-email \
        --allow-root

    echo "👤 Creating second user..."
    wp user create "$USER_NAME" "$USER_EMAIL" \
        --user_pass="$USER_PS" \
        --role=author \
        --allow-root

    echo "🎨 Installing and activating theme..."
    wp theme install "$WP_THEME" --activate --allow-root

    echo "✅ WordPress setup complete."
else
    echo "✅ WordPress already installed. Skipping setup."
fi


# Fix permissions
chown -R www-data:www-data /var/www/html

# Run PHP-FPM in foreground
exec php-fpm7.3 -F
