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

# Check if WORDPRESS_NAME_DIR is set and not empty
if [ -z "$WORDPRESS_NAME_DIR" ]; then
    WORDPRESS_NAME_DIR="wordpress"
fi

# Conditionally move the WordPress directory
if [ "$WORDPRESS_NAME_DIR" != "wordpress" ]; then
    sudo mv /var/www/wordpress /var/www/${WORDPRESS_NAME_DIR}
else
    echo "Using default WordPress directory, no need to move."
fi