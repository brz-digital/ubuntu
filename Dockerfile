FROM ubuntu:bionic

MAINTAINER "Hugo Fabricio" <hugo@brzdigital.com.br>

# Update sources list
RUN apt-get update -y && apt-get upgrade -y

# Add user to www-data
RUN usermod -u 1000 www-data

# Required by add-apt-repository
RUN apt-get install -y \
    python-software-properties \
    software-properties-common \
    wget \
    locales

# Genereating locales
RUN locale-gen en_US.UTF-8 \
    locale-gen pt_BR.UTF-8 \
    locale-gen es_ES.UTF-8 \
    dpkg-reconfigure locales

# Define default locale
RUN update-locale LANG=pt_BR.UTF-8

# Update repositories
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update -y && apt-get upgrade -y

# Install wkhtmltopdf
RUN apt-get install -y fontconfig libxrender1 xfonts-base xfonts-75dpi libjpeg-turbo8 libxext6
RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
    tar vxf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN ln -s /usr/local/bin/wkhtmltopdf /usr/bin/wkhtmltopdf
