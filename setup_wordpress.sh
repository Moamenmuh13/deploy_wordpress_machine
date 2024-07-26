#!/bin/bash

# Download and configure WordPress
echo "Downloading and configuring WordPress..."
sudo mkdir -p /var/www/
TARBALL="/tmp/wordpress.tar.gz"

if [ ! -f "$TARBALL" ]; then
    echo "Downloading WordPress..."
    wget https://wordpress.org/latest.tar.gz -O "$TARBALL"
else
    echo "WordPress tarball already downloaded."
fi

# Extract WordPress
echo "Extracting WordPress..."
sudo tar -xzf "$TARBALL" -C /var/www

sudo mv /var/www/wordpress /var/www/${WORDPRESS_NAME_DIR}

# Ensure the directory is accessible to www-data
sudo chown -R www-data:www-data /var/www
sudo chmod -R 755 /var/www
