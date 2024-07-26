# LEMP Stack Deployment for WordPress

This project provides a set of bash scripts to automate the deployment of a LEMP (Linux, Nginx, MariaDB, PHP) stack and WordPress on an Ubuntu server.

## Prerequisites

- Ubuntu server
- User with sudo privileges

## Components

1. **deploy_wordpress_lemp.sh**: Main script to deploy the entire stack.
2. **setup_mariadb.sh**: Script to set up MariaDB, create the WordPress database and user.
3. **setup_wordpress.sh**: Script to download and configure WordPress.
4. **setup_php.sh**: Script to configure PHP for WordPress.
5. **setup_nginx.sh**: Script to configure Nginx for WordPress.

## File Descriptions

- **deploy_wordpress_lemp.sh**
    - The main script to update the system, install necessary packages, and execute the setup scripts for MariaDB, WordPress, PHP, and Nginx.

- **setup_mariadb.sh**
    - Starts and enables the MariaDB service, creates the WordPress database, and sets up the database user with necessary privileges.

- **setup_wordpress.sh**
    - Downloads and extracts the latest WordPress package, sets appropriate permissions, and ensures the directory is accessible to the web server.

- **setup_php.sh**
    - Creates the wp-config.php file and configures it with the database details provided during the setup.

- **setup_nginx.sh**
    - Starts the Nginx service, configures the firewall, sets up the Nginx configuration for WordPress, tests the configuration, and reloads Nginx.

## Usage

```bash
### Step 1: Clone the Repository
git clone https://github.com/Moamenmuh13/deploy_wordpress_machine.git
cd deploy_wordpress_machine
 

### Step 2: Make Scripts Executable
chmod +x deploy_wordpress_lemp.sh setup_mariadb.sh setup_wordpress.sh setup_php.sh setup_nginx.sh

### Step 3: Run the Deployment Script
./deploy_wordpress_lemp.sh

## Follow Prompts:
## The script will prompt you for the following information:

Database name (default: wordpress)
Database user (default: rainpole)
Database password (default: Newpass1234)
MySQL root password (default: Newpass1234)
Domain or IP address for Nginx configuration (default: localhost)