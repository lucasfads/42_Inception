# Requisitos
 - Docker
 - Containerd
 - Make
 - Git

# NGINX
É ele que nos permitirá acessar nosso site WordPress. O trabalho dele é basicamente cuidar das portas.

# ENV Exemplo
```
INTRA_LOGIN=lucafern

DOMAIN_NAME=lucafern.42.fr

CERT_=./srcs/tools/lucafern.42.fr.crt
KEY_=./srcs/tools/lucafern.42.fr.key

MYSQL_HOST=mariadb
MYSQL_ROOT_PASSWORD=123456

WP_DB_NAME=wordpress
WP_DB_USER=lucafern
WP_DB_PASSWORD=123456
```