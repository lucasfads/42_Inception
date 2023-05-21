#!/bin/bash

# MySQL might be in a different location in Debian
MYSQL_DIR="/var/lib/mysql"
MYSQL_DATA_DIR="/var/lib/mysql/mysql"

if [ ! -d "${MYSQL_DATA_DIR}" ]; then

        chown -R mysql:mysql ${MYSQL_DIR}

        # Debian might use mariadb-install-db instead of mysql_install_db
        mariadb-install-db --basedir=/usr --datadir=${MYSQL_DIR} --user=mysql

        tfile=`mktemp`
        if [ ! -f "$tfile" ]; then
                return 1
        fi
fi

if [ ! -d "${MYSQL_DIR}/wordpress" ]; then

        cat << EOF > /tmp/create_db.sql
USE mysql;
FLUSH PRIVILEGES;
DELETE FROM     mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT}';
CREATE DATABASE ${DB_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '${DB_USER}'@'%' IDENTIFIED by '${DB_PASS}';
GRANT ALL PRIVILEGES ON wordpress.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF
        # mysqld location might be different in Debian, use the full path if necessary
        /usr/sbin/mysqld --user=mysql --bootstrap < /tmp/create_db.sql
        rm -f /tmp/create_db.sql
fi
