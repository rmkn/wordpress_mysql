FROM rmkn/php
MAINTAINER rmkn

RUN yum -y install php-mysql mysql-server
RUN curl -o /tmp/wordpress.tar.gz -SL https://ja.wordpress.org/latest-ja.tar.gz \
        && tar xzf /tmp/wordpress.tar.gz -C /var/www/html/ --strip=1 \
        && chmod 777 /var/www/html \
        && chown -R apache. /var/www/html/*

COPY entrypoint.sh /

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

ENTRYPOINT ["/entrypoint.sh"]
