sed -i -e 's/autoindex on/autoindex off/g' /etc/nginx/sites-enabled/nginx_conf
nginx -t
service nginx reload
