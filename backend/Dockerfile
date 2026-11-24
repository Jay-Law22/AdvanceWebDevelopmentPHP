
FROM composer:2 AS composer

FROM php:8.4-fpm

WORKDIR /var/www/html

# Install unzip so Composer can extract downloaded package archives.
# Install the PDO MySQL extension required by the application.
RUN apt-get update \
    && apt-get install -y --no-install-recommends unzip \
    && docker-php-ext-install pdo_mysql \
    && rm -rf /var/lib/apt/lists/*

# Make Composer available in the PHP runtime image.
COPY --from=composer /usr/bin/composer /usr/bin/composer

# Install production dependencies from the lock file.
COPY composer.json composer.lock ./

RUN composer install \
    --no-dev \
    --prefer-dist \
    --no-interaction \
    --no-progress \
    --optimize-autoloader

# Configure PHP file-upload limits.
COPY php-upload.ini /usr/local/etc/php/conf.d/uploads.ini

# Copy the application code.
COPY . .

# Private, persistent storage for uploaded ticket attachments.
RUN mkdir -p /var/www/uploads/ticket-attachments \
    && chown -R www-data:www-data /var/www/uploads \
    && chmod 0750 /var/www/uploads/ticket-attachments

COPY docker-entrypoint.sh /usr/local/bin/helpdesk-entrypoint

RUN chmod +x /usr/local/bin/helpdesk-entrypoint

ENTRYPOINT ["/usr/local/bin/helpdesk-entrypoint"]
CMD ["php-fpm"]

EXPOSE 9000
