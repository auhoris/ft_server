#RUN MYSQL
service mysql start
#CONFIG MYSQL
mariadb < /tmp/wpinfo

chown -R www-data /var/www/*

#SSL SETTINGS
mkdir /etc/nginx/ssl
chmod 700 /etc/nginx/ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/sslkey.key -out /etc/nginx/ssl/sslkey.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=21 SCHOOL/OU=auhoris/CN=localhost"

#PHP SETTINGS
service php7.3-fpm start
mkdir /var/www/localhost
mkdir /var/www/localhost/html
cp /tmp/index.php /var/www/localhost/html

#LINKING NGINX_CONF
ln -s /etc/nginx/sites-available/nginx_conf /etc/nginx/sites-enabled/
rm -rf /etc/nginx/sites-enabled/default

#PHPMYADMIN
mkdir /var/www/localhost/html/phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz
tar xvf phpMyAdmin-4.9.7-all-languages.tar.gz --strip-components=1 -C /var/www/localhost/html/phpmyadmin
mv /tmp/config.inc.php /var/www/localhost/html/phpmyadmin/config.inc.php

#WORDPRESS
cd /tmp
curl -O https://wordpress.org/wordpress-5.6.tar.gz
tar xzvf wordpress-5.6.tar.gz
cp -a /tmp/wordpress/. /var/www/localhost/html/wordpress
mv /tmp/wp-config.php /var/www/localhost/html/wordpress

#RUN NGINX
nginx -t
service nginx start
bash
