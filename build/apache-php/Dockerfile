FROM ubuntu:16.04

MAINTAINER Kichink

RUN apt-get clean && apt-get update
RUN apt-get install locales
RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update \
    && apt-get install -y software-properties-common \
    && apt-get install -y apache2 \
    && add-apt-repository -y ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y --allow-unauthenticated php5.6 \
    && apt-get install -y --allow-unauthenticated php5.6-mcrypt libapache2-mod-php5.6 \
       php5.6-mysql php5.6-curl php5.6-sqlite php5.6-xdebug nano php5.6-mbstring php5.6-simplexml \
       php5.6-gd redis-tools \
    && apt-get install -y vim dnsutils iputils-ping \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && apt-get install -y curl zip unzip git \
    && mkdir /run/php

RUN   echo "zend_extension_ts=\"/usr/lib/php/20131226/xdebug.so\"" >> /etc/php/5.6/apache2/php.ini
RUN   echo "xdebug.remote_autostart=on" >> /etc/php/5.6/apache2/php.ini
RUN   echo "xdebug.remote_connect_back=off" >> /etc/php/5.6/apache2/php.ini
RUN   echo "xdebug.remote_handler=dbgp" >> /etc/php/5.6/apache2/php.ini
RUN   echo "xdebug.profiler_enable=0" >> /etc/php/5.6/apache2/php.ini
RUN   echo "xdebug.profiler_output_dir=\"/var/www/html\"" >> /etc/php/5.6/apache2/php.ini
RUN   echo "xdebug.idekey=\"PHP-DEBUG\"" >> /etc/php/5.6/apache2/php.ini
RUN   echo "xdebug.remote_port=9000" >> /etc/php/5.6/apache2/php.ini

ENV TERM=xterm

# Habilitar modrewrite en apache
RUN a2enmod rewrite

# Incluye las configuraciones de los sitios que estan en el Host
# mediante la carpeta /etc/apache2/from-host
RUN echo "" >> /etc/apache2/apache2.conf \
    && echo "# Include the configurations from the host machine" >> /etc/apache2/apache2.conf \
    && echo "IncludeOptional from-host/*.conf" >> /etc/apache2/apache2.conf

EXPOSE 80
CMD /usr/sbin/apache2ctl -D FOREGROUND
