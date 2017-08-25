FROM centos:7

MAINTAINER Alfredo Peña Alonso <alfredopenaalonso@gmail.com>

# Update packages
RUN yum -y update

# Install EPEL
RUN yum install -y epel-release

# Install, configure and start Nginx
RUN yum install -y nginx

# Install and start MariaDB
RUN yum install -y mariadb-server mariadb

# Install, configure and start PHP-FPM and XDebug
RUN yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum install -y --enablerepo=remi --enablerepo=remi-php56 php-fpm php-mysql php-mbstring php-devel php-pear
RUN yum install -y gcc gcc-c++ autoconf automake
RUN pecl install Xdebug
RUN sed -i '/^;cgi.fix_pathinfo=1$/c\cgi.fix_pathinfo=0' /etc/php.ini
RUN sed -i '/^user\s=\sapache$/c\user = nginx' /etc/php-fpm.d/www.conf
RUN sed -i '/^group\s=\sapache$/c\group = nginx' /etc/php-fpm.d/www.conf

EXPOSE 80 443 3306
