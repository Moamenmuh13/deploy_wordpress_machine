#!/bin/bash

# Define the WordPress configuration file path
WP_CONFIG="/var/www/wordpress/wp-config.php"

# Create wp-config.php file
echo "Creating wp-config.php file..."
sudo cp /var/www/wordpress/wp-config-sample.php $WP_CONFIG
sudo sed -i "s/database_name_here/${DB_NAME}/" $WP_CONFIG
sudo sed -i "s/username_here/${DB_USER}/" $WP_CONFIG
sudo sed -i "s/password_here/${DB_PASS}/" $WP_CONFIG
