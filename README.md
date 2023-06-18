# Requisitos
 - Docker
 - Docker compose
 - Make
 - Git

# NGINX
É ele que nos permitirá acessar nosso site WordPress. O trabalho dele é basicamente cuidar das portas.

# MariaDB
Seu banco de dados

# WordPress
CMS (Content Management System) mais usado do mundo.

# ENV Exemplo
```
INTRA_LOGIN="login"

DOMAIN_NAME="login.42.fr"

CERT_="./srcs/tools/login.42.fr.crt"
KEY_="./srcs/tools/login.42.fr.key"

MYSQL_HOST="mariadb"
MYSQL_ROOT_PASSWORD="password1"

WP_DB_NAME="databasename"
WP_DB_USER="login"
WP_DB_PASSWORD="password2"

WP_SITE_NAME="My cool site"
WP_ADMIN_NAME="nimda"
WP_ADMIN_PASSWORD="nimda1234"
WP_ADMIN_EMAIL="nimda@email.com"
WP_USER_NAME="anotheruser"
WP_USER_PASSWORD="user1234"
WP_USER_EMAIL="anotheruser@email.com"
```