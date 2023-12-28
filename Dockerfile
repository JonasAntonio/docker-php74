# Use an official PHP runtime as a parent image
FROM php:7.4-apache

RUN apt update -y
RUN apt upgrade -y
# RUN apt install -y curl
RUN apt install -y git

# Install necessary PHP extensions
RUN docker-php-ext-install pdo_mysql

# Enable Apache Rewrite Module
RUN a2enmod rewrite

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Copy the current directory contents into the container at /var/www/html
COPY . /var/www/html

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable for Apache (if needed)
# ENV APACHE_RUN_USER www-data
# ENV APACHE_RUN_GROUP www-data
# ENV APACHE_LOG_DIR /var/log/apache2

# By default, start the apache server when the container is run
CMD ["apache2-foreground"]
