# LEMP Stack Deployment for WordPress

This project provides a set of bash scripts to automate the deployment of a LEMP (Linux, Nginx, MariaDB, PHP) stack and WordPress on an Ubuntu server.

## Prerequisites

- Ubuntu server
- User with sudo privileges

## Components

1. **deploy.sh**: Main script to deploy the entire stack.
2. **setup_mariadb.sh**: Script to set up MariaDB, create the WordPress database and user.
3. **setup_wordpress.sh**: Script to download and configure WordPress.
4. **setup_php.sh**: Script to configure PHP for WordPress.
5. **setup_nginx.sh**: Script to configure Nginx for WordPress.

## Usage

### Step 1: Clone the Repository

```bash
git clone https://github.com/Moamenmuh13/deploy_wordpress_machine.git
cd deploy_wordpress_machine

### Step 2: Make Scripts Executable
chmod +x deploy_wordpress_lemp.sh setup_mariadb.sh setup_wordpress.sh setup_php.sh setup_nginx.sh|

### Step 3: Run the Deployment Script

./deploy_wordpress_lemp.sh
