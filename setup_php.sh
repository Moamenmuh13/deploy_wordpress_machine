#!/bin/bash
	sudo apt install apache2 \
                 ghostscript \
                 libapache2-mod-php \
                 mysql-server \
                 php \
                 php-bcmath \
                 php-curl \
                 php-imagick \
                 php-intl \
                 php-json \
                 php-mbstring \
                 php-mysql \
                 php-xml \
                 php-zip -y

     
WP_DIR=${WP_DIR:-/srv/www/wordpress}

# Create wp-config.php file
echo "Creating wp-config.php file..."
sudo cp ${WP_DIR}/wp-config-sample.php ${WP_DIR}/wp-config.php
sudo sed -i "s/database_name_here/${DB_NAME}/" ${WP_DIR}/wp-config.php
sudo sed -i "s/username_here/${DB_USER}/" ${WP_DIR}/wp-config.php
sudo sed -i "s/password_here/${DB_PASS}/" ${WP_DIR}/wp-config.php

