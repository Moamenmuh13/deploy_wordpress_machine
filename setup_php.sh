#!/bin/bash
	sudo apt install apache2 \
                 ghostscript \
                 libapache2-mod-php \
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

     

# Create wp-config.php file
echo "Creating wp-config.php file..."
sudo cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
sudo sed -i "s/database_name_here/${DB_NAME}/" /var/www/wordpress/wp-config.php
sudo sed -i "s/username_here/${DB_USER}/" /var/www/wordpress/wp-config.php
sudo sed -i "s/password_here/${DB_PASS}/" /var/www/wordpress/wp-config.php

