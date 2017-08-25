FROM centos:latest

MAINTAINER Alfredo Peña Alonso <alfredopenaalonso@gmail.com>

# Update packages
RUN yum -y update

# Install EPEL and Git
RUN yum install -y epel-release
RUN yum install -y git

# Install, configure and start Nginx
RUN yum install -y nginx
RUN echo "include /data/nginx/sites-enabled/*;" > /etc/nginx/conf.d/sites-enabled.conf

# Install and start MariaDB
RUN yum install -y mariadb-server mariadb

EXPOSE 80 443 3036
