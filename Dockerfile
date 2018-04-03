FROM ubuntu:xenial

MAINTAINER "Joao Paulo Barbosa" <jpaulobneto@gmail.com>

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
    && locale-gen pt_BR.UTF-8

# Update repositories
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update -y && apt-get upgrade -y

# Install wkhtmltopdf
RUN apt-get install -y fontconfig libxrender1 xfonts-base xfonts-75dpi libjpeg-turbo8 libxext6
RUN wget http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb \
    && dpkg -i wkhtmltox-0.12.2.1_linux-trusty-amd64.deb

RUN ln -s /usr/local/bin/wkhtmltopdf /usr/bin/wkhtmltopdf
