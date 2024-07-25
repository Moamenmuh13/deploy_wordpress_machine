#!/bin/bash

# Download and configure WordPress
echo "Downloading and configuring WordPress..."

# Set default WordPress directory if not provided by the user
read -p "Enter the WordPress directory (default: /var/www/wordpress): " WP_DIR

# Create necessary directories
sudo mkdir -p /var/www/


# Check if the WordPress tarball already exists
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

# Ensure the directory is accessible to www-data
sudo chown -R www-data:www-data /var/www

# Move WordPress to the desired directory
sudo chmod -R 755 /var/www

