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
INTRA_LOGIN=login

DOMAIN_NAME=login.42.fr

CERT_=./srcs/tools/login.42.fr.crt
KEY_=./srcs/tools/login.42.fr.key

MYSQL_HOST=mariadb
MYSQL_ROOT_PASSWORD=password1

WP_DB_NAME=databasename
WP_DB_USER=login
WP_DB_PASSWORD=password2
```