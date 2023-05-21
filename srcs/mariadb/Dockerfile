FROM debian:buster

ARG DB_NAME
ARG DB_USER
ARG DB_PASS

RUN apt update
RUN apt install -y mariadb-server mariadb-client

RUN mkdir /var/run/mysqld; \
    chmod 777 /var/run/mysqld; \
    mkdir -p /etc/my.cnf.d; \
    { echo '[mysqld]'; \
    echo 'skip-host-cache'; \
    echo 'skip-name-resolve'; \
    echo 'bind-address=0.0.0.0'; \
    } | tee /etc/my.cnf.d/docker.cnf; \
    if [ -f "/etc/my.cnf.d/mariadb-server.cnf" ]; then \
        sed -i "s|skip-networking|skip-networking=0|g" /etc/my.cnf.d/mariadb-server.cnf; \
    fi

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql || \
    (echo "MariaDB/MySQL installation failed. Checking logs for more information." && \
    cat /var/log/mysql/error.log && \
    exit 1)

EXPOSE 3306

COPY conf/create_db.sh .
RUN sh create_db.sh && rm create_db.sh
USER mysql
CMD ["/usr/sbin/mysqld", "--skip-log-error"]
