#!/bin/bash

# Create wp-config.php file
echo "Creating wp-config.php file..."
sudo cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
sudo sed -i "s/database_name_here/${DB_NAME}/" /var/www/wordpress/wp-config.php
sudo sed -i "s/username_here/${DB_USER}/" /var/www/wordpress/wp-config.php
sudo sed -i "s/password_here/${DB_PASS}/" /var/www/wordpress/wp-config.php

