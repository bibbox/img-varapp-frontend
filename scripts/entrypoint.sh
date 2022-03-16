#! /bin/bash



backend_url=${BACKEND_URL:-"'+window.location.protocol + '\/\/' + window.location.hostname+':8000\/varapp'+'"}
sed -i "s/http:\/\/localhost:8000\/varapp/$backend_url/g" /var/www/html/varapp-web/conf/conf.js

service apache2 start 

tail -f dev/null
