#!/bin/sh

service mysqld start
mysql -uroot -e"create database wpdb; grant all on wpdb.* to 'wpadmin'@'localhost' identified by 'password';"


exec "$@"
