# Define the WordPress configuration file path
WP_CONFIG="/var/www/${WORDPRESS_NAME_DIR}/wp-config.php"

# Check if the directory exists, if not create it
if [ ! -d "/var/www/${WORDPRESS_NAME_DIR}" ]; then
    echo "Directory /var/www/${WORDPRESS_NAME_DIR} does not exist. Creating it..."
    sudo mkdir -p /var/www/${WORDPRESS_NAME_DIR}
fi

# Create wp-config.php file
echo "Creating wp-config.php file..."
if [ -f "/var/www/${WORDPRESS_NAME_DIR}/wp-config-sample.php" ]; then
    sudo cp /var/www/${WORDPRESS_NAME_DIR}/wp-config-sample.php $WP_CONFIG
    sudo sed -i "s/database_name_here/${DB_NAME}/" $WP_CONFIG
    sudo sed -i "s/username_here/${DB_USER}/" $WP_CONFIG
    sudo sed -i "s/password_here/${DB_PASS}/" $WP_CONFIG
else
    echo "Error: wp-config-sample.php not found in /var/www/${WORDPRESS_NAME_DIR}"
fi
