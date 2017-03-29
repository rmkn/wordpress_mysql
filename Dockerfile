FROM rmkn/php
MAINTAINER rmkn

RUN yum -y install php-mysql mysql-server
RUN curl -o /tmp/wordpress.tar.gz -SL https://ja.wordpress.org/latest-ja.tar.gz \
        && tar xzf /tmp/wordpress.tar.gz -C /var/www/html/ --strip=1 \
        && chmod 777 /var/www/html \
        && chown -R apache. /var/www/html/*
RUN curl -o /var/www/html/adminer.php -SL https://github.com/vrana/adminer/releases/download/v4.3.0/adminer-4.3.0-mysql.php \
	&& chown apache. /var/www/html/adminer.php

COPY entrypoint.sh /

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

ENTRYPOINT ["/entrypoint.sh"]
