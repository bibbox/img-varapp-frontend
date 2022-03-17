#! /bin/bash


#backend_protocol=${BACKEND_PROTOCOL:-"'+window.location.protocol+'"}
backend_protocol="'+window.location.protocol+'"
if [[ ! -z "${BACKEND_PROTOCOL}" ]]; then
  backend_protocol="${BACKEND_PROTOCOL}:"
fi
#backend_url=${BACKEND_LOCATION:-"'+window.location.protocol + '\/\/' + window.location.hostname+':8000\/varapp'+'"}
backend_location=${BACKEND_LOCATION:-"'+ window.location.hostname+':8000\/varapp'+'"}
backend_url="${backend_protocol}\/\/${backend_location}"
sed -i -e "s@http:\/\/localhost:8000\/varapp@${backend_url}@g" /var/www/html/varapp-web/conf/conf.js

service apache2 start 

tail -f dev/null
