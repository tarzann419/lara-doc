FROM php:8.2-apache
  
WORKDIR /var/www/html
  
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    && docker-php-ext-install zip pdo_mysql
  
# copies the local application code into the /var/www/html/ directory in the container

COPY . /var/www/html/


# sets ownership and permissions for specific directories
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
RUN chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache
  
EXPOSE 80