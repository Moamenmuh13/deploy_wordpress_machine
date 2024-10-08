#!/bin/bash

# Prompt for user inputs
read -p "Enter the database name (default: wordpress): " DB_NAME
DB_NAME=${DB_NAME:-wordpress}
read -p "Enter the database user (default: rainpole): " DB_USER
DB_USER=${DB_USER:-rainpole}
read -sp "Enter the database password (default: Newpass1234!): " DB_PASS
echo
DB_PASS=${DB_PASS:-Newpass1234}
read -p "Enter your domain or IP address for Nginx configuration (default: localhost): " SERVER_NAME
SERVER_NAME=${SERVER_NAME:-localhost}
read -p "Enter the destination of wordpress config directory (default: /var/www/wordpress) : " WORDPRESS_NAME_DIR
echo
WORDPRESS_NAME_DIR=${WORDPRESS_NAME_DIR:-wordpress}

export DB_NAME DB_USER DB_PASS DB_ROOT_PASS SERVER_NAME WORDPRESS_NAME_DIR

echo "Update and upgrade the system"
sudo apt update -y && sudo apt upgrade -y 

echo "Starting LEMP stack deployment..."

echo "Start installing MariaDB"
sudo apt install mariadb-server mariadb-client -y && sudo apt install expect -y 

bash setup_mariadb.sh

echo -e "\n Mariadb installed.✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅\n"

echo "Start installing WordPress"
bash setup_wordpress.sh

echo -e "\n WordPress installed.✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅\n"

echo "Start installing PHP"
sudo apt install ghostscript \
                libapache2-mod-php \
                php \
                php8.1-fpm \
                php-bcmath \
                php-curl \
                php-imagick \
                php-intl \
                php-json \
                php-mbstring \
                php-mysql \
                php-xml \
                php-zip -y

bash setup_php.sh
sudo systemctl stop apache2
echo -e "\n PHP installed.✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅\n"

echo "Start installing Nginx"
sudo apt-get install nginx -y
bash setup_nginx.sh

echo -e "\n Nginx installed.✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅\n"

# Define the output file path
OUTPUT_FILE="$HOME/deployment_info.txt"

# Write the important variables to the file
echo -e "\nScript completed successfully. Here are the important variables:\n" > "$OUTPUT_FILE"
echo "Database Name: $DB_NAME" >> "$OUTPUT_FILE"
echo "Database User: $DB_USER" >> "$OUTPUT_FILE"
echo "Database Password: $DB_PASS" >> "$OUTPUT_FILE"
echo "Server Name: $SERVER_NAME" >> "$OUTPUT_FILE"
echo "WordPress Directory: $WORDPRESS_NAME_DIR" >> "$OUTPUT_FILE"


echo -e "\nImportant variables have been saved to $OUTPUT_FILE"
