#!/bin/bash

# Updating and upgrading the system
echo "Updating and upgrading the system"
sudo apt update && sudo apt upgrade -y  


# Install MairaDB package
sudo apt install mariadb-server -y && sudo apt install expect -y 
sudo systemctl start mariadb
sudo systemctl enable mariadb


# After the installation Check the status of the mariadb service
if systemctl is-active --quiet mariadb.service; then
    echo "MariaDB is running. Doing the first job..."
    # Place your code for the first job here

    # Create a database and user for WordPress
    echo "Creating WordPress database and user..."
    sudo mysql -u root -p"${DB_ROOT_PASS}" -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
    sudo mysql -u root -p"${DB_ROOT_PASS}" -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}';"
    sudo mysql -u root -p"${DB_ROOT_PASS}" -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'localhost';"
    sudo mysql -u root -p"${DB_ROOT_PASS}" -e "FLUSH PRIVILEGES;"

else
    echo "MariaDB is not running. Doing the second job..."
    sudo systemctl restart mariadb.service
 fi
