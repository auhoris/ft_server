FROM debian:buster

#INSTALLING STUFF
RUN apt update
RUN apt install -y nginx
RUN apt install -y php7.3-fpm php-mysql
RUN apt install -y mariadb-server
RUN apt install -y wget
RUN apt install -y curl

#COPYING FILES
COPY ./srcs/server_start.sh .
COPY ./srcs/nginx_conf ./etc/nginx/sites-available/
COPY ./srcs/index.php ./tmp/
COPY ./srcs/wpinfo ./tmp/
COPY ./srcs/config.inc.php ./tmp/
COPY ./srcs/wp-config.php ./tmp/
COPY ./srcs/autoindex_on.sh .
COPY ./srcs/autoindex_off.sh .

#START
CMD bash server_start.sh
