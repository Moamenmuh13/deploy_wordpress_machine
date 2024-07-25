#!/bin/bash

# Install MairaDB package
sudo systemctl start mariadb
sudo systemctl enable mariadb


echo "MariaDB is running....."
# Place your code for the first job here  # Create a database and user for WordPress
echo "Creating WordPress database and user..."
sudo mysql -u root -p"${DB_ROOT_PASS}" -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
sudo mysql -u root -p"${DB_ROOT_PASS}" -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}';"
sudo mysql -u root -p"${DB_ROOT_PASS}" -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'localhost';"
sudo mysql -u root -p"${DB_ROOT_PASS}" -e "FLUSH PRIVILEGES;"