#!/bin/sh

service mysqld start
mysql -u root -e "GRANT ALL PRIVILEGES ON wpdb.* TO wpadmin@localhost IDENTIFIED BY 'wpadmin';"
if [ $? -eq 0 ]; then
	mysql -u root -e "FLUSH PRIVILEGES;"
	mysql -u root -e "create database wpdb;"
fi

exec "$@"
