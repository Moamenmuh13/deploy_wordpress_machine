#!/bin/bash

# Prompt for user inputs
read -p "Enter the database name (default: wordpress): " DB_NAME
DB_NAME=${DB_NAME:-wordpress}
read -p "Enter the database user (default: rainpole!): " DB_USER
DB_USER=${DB_USER:-rainpole}
read -sp "Enter the database password (default: Newpass1234!): " DB_PASS
echo
DB_PASS=${DB_PASS:-Newpass1234}
read -sp "Enter the MySQL root password (default: Newpass1234): " DB_ROOT_PASS
echo
DB_ROOT_PASS=${DB_ROOT_PASS:-Newpass1234}
read -p "Enter your domain or IP address for Nginx configuration (default: localhost): " SERVER_NAME
SERVER_NAME=${SERVER_NAME:-localhost}


# NGINX_CONF="/etc/nginx/sites-available/wordpress"
export DB_NAME DB_USER DB_PASS DB_ROOT_PASS SERVER_NAME

echo

echo "Starting LEMP stack deployment..."

echo "Start installing MariaDB"
bash setup_mariadb.sh

echo -e "\nCompleted.✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅\n"

echo "Start installing Wordpress"
bash setup_wordpress.sh

echo -e "\nCompleted.✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅\n"

echo "Start installing PHP"
bash setup_php.sh

echo -e "\nCompleted.✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅\n"

echo "Start installing Nginx"
bash setup_nginx.sh

echo -e "\nCompleted.✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅\n"
