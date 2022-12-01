FROM ubuntu:22.04

RUN apt-get update
# Installing core modules
RUN apt-get install nano
RUN apt-get install -y nginx
# copying core content
COPY angular-shop/ /var/www/html/angular-shop
COPY default /etc/nginx/sites-available/
# removing irrelevant files
# RUN  rm /var/www/html/angular-shop/index.nginx-debian.html
# RUN  rm /var/www/html/default

CMD service nginx start && tail -F /var/log/nginx/error.log
