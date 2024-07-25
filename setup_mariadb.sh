#!/bin/bash

# Start and enable MariaDB service
sudo systemctl start mariadb
sudo systemctl enable mariadb

# Create database and user for WordPress
echo "Creating WordPress database and user..."
sudo mysql -u root -p"${DB_ROOT_PASS}" <<EOF./
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'localhost';
FLUSH PRIVILEGES;
EOF
