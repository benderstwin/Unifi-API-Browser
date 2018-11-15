FROM php:7.2-apache
LABEL Name=unifi-api-browser Version=0.0.1
RUN apt-get -y update && apt-get install -y \
curl \
git
WORKDIR /app
RUN cd /var/www/html && git clone https://github.com/Art-of-WiFi/UniFi-API-browser.git .
RUN curl https://raw.githubusercontent.com/benderstwin/Unifi-API-Browser/master/config.php > /var/www/html/config.php
ENV ENV_USER=user \
    ENV_PWD=pass \
    ENV_URL=url
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
