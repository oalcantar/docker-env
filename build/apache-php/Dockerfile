FROM ubuntu:16.04

MAINTAINER Kichink

RUN apt-get clean && apt-get update
RUN apt-get install locales
RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get install -y software-properties-common \
    && apt-get install -y apache2 \
    && add-apt-repository -y ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y --allow-unauthenticated php5.6 \
    && apt-get install -y --allow-unauthenticated php5.6-mcrypt libapache2-mod-php5.6 \
       php5.6-mysql php5.6-curl php5.6-sqlite php5.6-mbstring php5.6-simplexml \
       php5.6-gd \
    && apt-get install -y vim dnsutils iputils-ping \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && apt-get install -y curl zip unzip git \
    && mkdir /run/php

ENV TERM=xterm

# Habilitar modrewrite en apache
RUN a2enmod rewrite
# Renicia el servidor de apache
RUN service apache2 restart

# Variables de ambiente
ENV APACHE_SITES_AVAILABLE_DIR etc/apache2/sites-available
ENV TEMPLATE_EMAIL admin@server.com

ARG APIV2_SERVERNAME
ARG APIV2_DOCUMENT_ROOT
ARG WWW_SERVERNAME
ARG WWW_DOCUMENT_ROOT
ARG API_SERVERNAME
ARG API_DOCUMENT_ROOT
ARG ADMIN_SERVERNAME
ARG ADMIN_DOCUMENT_ROOT
ARG KONTROL_SERVERNAME
ARG KONTROL_DOCUMENT_ROOT
ARG PAGOS_SERVERNAME
ARG PAGOS_DOCUMENT_ROOT
ARG KAD_SERVERNAME
ARG KAD_DOCUMENT_ROOT
ARG EXPERT_SERVERNAME
ARG EXPERT_DOCUMENT_ROOT
ARG ATOMICO_SERVERNAME
ARG ATOMICO_DOCUMENT_ROOT

# ----------------------- APIV2 --------------------------------
# Agregar la config de APIV2 en apache
ADD default.conf $APACHE_SITES_AVAILABLE_DIR/kichink_apiv2.conf
RUN sed -i 's/template.email/'$TEMPLATE_EMAIL'/g' $APACHE_SITES_AVAILABLE_DIR/kichink_apiv2.conf
RUN sed -i 's/template.servername/'$APIV2_SERVERNAME'/g' $APACHE_SITES_AVAILABLE_DIR/kichink_apiv2.conf
RUN sed -i 's#template.documentroot#'$APIV2_DOCUMENT_ROOT'#g' $APACHE_SITES_AVAILABLE_DIR/kichink_apiv2.conf
RUN a2ensite kichink_apiv2.conf

# ----------------------- WWW --------------------------------
# Agregar la config de WWW en apache
ADD default.conf $APACHE_SITES_AVAILABLE_DIR/kichink_www.conf
RUN sed -i 's/template.email/'$TEMPLATE_EMAIL'/g' $APACHE_SITES_AVAILABLE_DIR/kichink_www.conf
RUN sed -i 's/template.servername/'$WWW_SERVERNAME'/g' $APACHE_SITES_AVAILABLE_DIR/kichink_www.conf
RUN sed -i 's#template.documentroot#'$WWW_DOCUMENT_ROOT'#g' $APACHE_SITES_AVAILABLE_DIR/kichink_www.conf
RUN a2ensite kichink_www.conf

# ----------------------- API --------------------------------
# Agregar la config de API en apache
ADD default.conf $APACHE_SITES_AVAILABLE_DIR/kichink_api.conf
RUN sed -i 's/template.email/'$TEMPLATE_EMAIL'/g' $APACHE_SITES_AVAILABLE_DIR/kichink_api.conf
RUN sed -i 's/template.servername/'$API_SERVERNAME'/g' $APACHE_SITES_AVAILABLE_DIR/kichink_api.conf
RUN sed -i 's#template.documentroot#'$API_DOCUMENT_ROOT'#g' $APACHE_SITES_AVAILABLE_DIR/kichink_api.conf
RUN a2ensite kichink_api.conf

# ----------------------- ADMIN --------------------------------
# Agregar la config de ADMIN en apache
ADD default.conf $APACHE_SITES_AVAILABLE_DIR/kichink_admin.conf
RUN sed -i 's/template.email/'$TEMPLATE_EMAIL'/g' $APACHE_SITES_AVAILABLE_DIR/kichink_admin.conf
RUN sed -i 's/template.servername/'$ADMIN_SERVERNAME'/g' $APACHE_SITES_AVAILABLE_DIR/kichink_admin.conf
RUN sed -i 's#template.documentroot#'$ADMIN_DOCUMENT_ROOT'#g' $APACHE_SITES_AVAILABLE_DIR/kichink_admin.conf
RUN a2ensite kichink_admin.conf

# ----------------------- KONTROL --------------------------------
# Agregar la config de KONTROL en apache
ADD default.conf $APACHE_SITES_AVAILABLE_DIR/kichink_kontrol.conf
RUN sed -i 's/template.email/'$TEMPLATE_EMAIL'/g' $APACHE_SITES_AVAILABLE_DIR/kichink_kontrol.conf
RUN sed -i 's/template.servername/'$KONTROL_SERVERNAME'/g' $APACHE_SITES_AVAILABLE_DIR/kichink_kontrol.conf
RUN sed -i 's#template.documentroot#'$KONTROL_DOCUMENT_ROOT'#g' $APACHE_SITES_AVAILABLE_DIR/kichink_kontrol.conf
RUN a2ensite kichink_kontrol.conf

# ----------------------- PAGOS --------------------------------
# Agregar la config de PAGOS en apache
ADD default.conf $APACHE_SITES_AVAILABLE_DIR/kichink_pagos.conf
RUN sed -i 's/template.email/'$TEMPLATE_EMAIL'/g' $APACHE_SITES_AVAILABLE_DIR/kichink_pagos.conf
RUN sed -i 's/template.servername/'$PAGOS_SERVERNAME'/g' $APACHE_SITES_AVAILABLE_DIR/kichink_pagos.conf
RUN sed -i 's#template.documentroot#'$PAGOS_DOCUMENT_ROOT'#g' $APACHE_SITES_AVAILABLE_DIR/kichink_pagos.conf
RUN a2ensite kichink_pagos.conf

# ----------------------- KAD --------------------------------
# Agregar la config de KAD en apache
ADD default.conf $APACHE_SITES_AVAILABLE_DIR/kichink_kad.conf
RUN sed -i 's/template.email/'$TEMPLATE_EMAIL'/g' $APACHE_SITES_AVAILABLE_DIR/kichink_kad.conf
RUN sed -i 's/template.servername/'$KAD_SERVERNAME'/g' $APACHE_SITES_AVAILABLE_DIR/kichink_kad.conf
RUN sed -i 's#template.documentroot#'$KAD_DOCUMENT_ROOT'#g' $APACHE_SITES_AVAILABLE_DIR/kichink_kad.conf
RUN a2ensite kichink_kad.conf

# ----------------------- EXPERT --------------------------------
# Agregar la config de EXPERT en apache
ADD default.conf $APACHE_SITES_AVAILABLE_DIR/kichink_expert.conf
RUN sed -i 's/template.email/'$TEMPLATE_EMAIL'/g' $APACHE_SITES_AVAILABLE_DIR/kichink_expert.conf
RUN sed -i 's/template.servername/'$EXPERT_SERVERNAME'/g' $APACHE_SITES_AVAILABLE_DIR/kichink_expert.conf
RUN sed -i 's#template.documentroot#'$EXPERT_DOCUMENT_ROOT'#g' $APACHE_SITES_AVAILABLE_DIR/kichink_expert.conf
RUN a2ensite kichink_expert.conf

# ----------------------- ATOMICO --------------------------------
# Agregar la config de ATOMICO en apache
ADD default.conf $APACHE_SITES_AVAILABLE_DIR/kichink_atomico.conf
RUN sed -i 's/template.email/'$TEMPLATE_EMAIL'/g' $APACHE_SITES_AVAILABLE_DIR/kichink_atomico.conf
RUN sed -i 's/template.servername/'$ATOMICO_SERVERNAME'/g' $APACHE_SITES_AVAILABLE_DIR/kichink_atomico.conf
RUN sed -i 's#template.documentroot#'$ATOMICO_DOCUMENT_ROOT'#g' $APACHE_SITES_AVAILABLE_DIR/kichink_atomico.conf
RUN a2ensite kichink_atomico.conf

EXPOSE 80
CMD /usr/sbin/apache2ctl -D FOREGROUND
