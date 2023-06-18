#!/bin/sh
cd /var/www/
if [ ! -f "/var/www/wp-config.php" ]; then
  /usr/local/bin/wp config create --dbname="${WP_DB_NAME}" --dbuser="${WP_DB_USER}" --dbpass="${WP_DB_PASSWORD}" --dbhost="${MYSQL_HOST}" --force
  /usr/local/bin/wp config set FS_METHOD 'direct'
  /usr/local/bin/wp config set WP_REDIS_HOST 'redis'
  /usr/local/bin/wp config set WP_REDIS_PORT 6379
  /usr/local/bin/wp config set WP_REDIS_TIMEOUT 1
  /usr/local/bin/wp config set WP_REDIS_READ_TIMEOUT 1
  /usr/local/bin/wp config set WP_REDIS_DATABASE 0
  
  /usr/local/bin/wp core install --url="https://${INTRA_LOGIN}.42.fr" --title="${WP_SITE_NAME}" --admin_user="${WP_ADMIN_NAME}" --admin_password="${WP_ADMIN_PASSWORD}" --admin_email="${WP_ADMIN_EMAIL}"
  /usr/local/bin/wp user create "${WP_USER_NAME}" "${WP_USER_EMAIL}" --role="editor" --user_pass="${WP_USER_PASSWORD}"
fi
