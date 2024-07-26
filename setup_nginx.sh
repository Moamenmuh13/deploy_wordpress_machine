#!/bin/bash

# Start nginx service and configure firewall
sudo systemctl start nginx
sudo ufw enable
sudo ufw allow 'Nginx HTTP'

# Give the user ownership to website files for easy editing
sudo chown -R "$USER":"$USER" /var/www/${WORDPRESS_NAME_DIR}

# Configure Nginx
NGINX_CONF="/etc/nginx/sites-available/${WORDPRESS_NAME_DIR}"
if [ ! -f ${NGINX_CONF} ]; then
  echo "Creating Nginx configuration file for WordPress..."
  sudo tee ${NGINX_CONF} > /dev/null <<EOL
server {
    listen 80;
    server_name ${SERVER_NAME};
    root /var/www/${WORDPRESS_NAME_DIR};

    index index.html index.htm index.php;

    location / {
        try_files \$uri \$uri/ =404;
    }

    location ~ \.php\$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }
}
EOL

  # Enable the new configuration by creating a symbolic link
  sudo ln -s ${NGINX_CONF} /etc/nginx/sites-enabled/
  sudo unlink /etc/nginx/sites-enabled/default
fi

# Test Nginx configuration and reload
sudo nginx -t
sudo systemctl restart nginx
