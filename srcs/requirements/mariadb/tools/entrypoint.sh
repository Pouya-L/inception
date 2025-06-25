#!/bin/bash
set -e

echo "⏳ Starting bootstrap mysqld..."
mysqld --user=mysql --skip-networking --datadir=/var/lib/mysql &
pid="$!"

until mysqladmin ping --silent; do
	sleep 1
done

echo "✅ Creating database and user..."
mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF

mysqladmin -u root -p"${DB_ROOT_PASSWORD}" shutdown
wait "$pid"

echo "🚀 Starting production mysqld..."
exec mysqld 
