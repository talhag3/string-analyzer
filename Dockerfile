FROM php:8.2-cli

# Install system dependencies + extensions via install-php-extensions
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions \
        intl \
        mbstring \
        zip \
        xdebug \
        @composer \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY . /app
WORKDIR /app

ENTRYPOINT ["php"]