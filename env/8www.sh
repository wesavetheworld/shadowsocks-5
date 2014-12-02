#!/bin/bash
sudo mkdir -p /var/www/root
sudo cp -fr tz.php /var/www/root/
cd /var/www
sudo chown -R www-data.www-data root
cd
sudo rm -rf /etc/nginx/sites-enabled/default
sudo sh -c "echo 'server {\n    listen      80;\n    root        /var/www/root;\n    index       index.html index.php;\n    access_log  /var/log/nginx/access_root.log;\n    error_log   /var/log/nginx/error_root.log;\n    include     mime.types;\n    location = /favicon.ico {\n        log_not_found off;\n        access_log off;\n    }\n    location = /robots.txt {\n        allow all;\n        log_not_found off;\n        access_log off;\n    }\n    location ~ /\. {\n        deny all;\n    }\n    location ~* /(?:uploads|files)/.*\.php$ {\n        deny all;\n    }\n    location / {\n        try_files \$uri \$uri/ /index.php?\$args;\n    }\n    location ~* ^.+\.(ogg|ogv|svg|svgz|eot|otf|woff|mp4|ttf|rss|atom|jpg|jpeg|gif|png|ico|zip|tgz|gz|rar|bz2|doc|xls|exe|ppt|tar|mid|midi|wav|bmp|rtf)$ {\n        access_log off; log_not_found off; expires max;\n    }\n    location ~ \.php$ {\n        try_files \$uri =404;\n        fastcgi_pass unix:/var/run/php5-fpm.sock;\n        fastcgi_index index.php;\n        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;\n        include fastcgi_params;\n    }\n}' > /etc/nginx/sites-enabled/default"
sudo service nginx restart