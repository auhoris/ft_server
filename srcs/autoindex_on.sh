sed -i -e 's/autoindex off/autoindex on/g' /etc/nginx/sites-enabled/nginx_conf
nginx -t
service nginx reload
