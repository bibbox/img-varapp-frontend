FROM ubuntu:22.04

RUN apt-get -y update && \
    apt-get install -y wget && \
    apt-get install -y  apache2 apache2-dev 
RUN mkdir /var/www/html/varapp-web/
 
WORKDIR /var/www/html/varapp-web/

RUN wget https://github.com/sib-swiss/varapp-frontend-react/releases/download/v2.0.3/varapp-frontend-react.tar.gz &&     tar -xf varapp-frontend-react.tar.gz &&    rm varapp-frontend-react.tar.gz  

# replace first macth
#sed -i '0,/localhost/s//varapp-backend/' conf/conf.js

WORKDIR /

ADD scripts /scripts

RUN chmod a+x /scripts/*.sh

EXPOSE 80

ENTRYPOINT ["/scripts/entrypoint.sh"]

