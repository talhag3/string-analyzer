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

# 🐛 Xdebug Configuration for Local Development
# • mode=debug,coverage      → Enables step-debugging & PHPUnit coverage reports
# • start_with_request=yes   → Auto-attaches Xdebug on every CLI run & web request
# • client_host              → Routes debug traffic back to your host machine (your IDE)
# • client_port=9003         → Standard Xdebug 3 DBGp port (matches VS Code/PhpStorm defaults)
# ⚠️  Disable or switch to mode=off in production to avoid performance overhead
RUN echo "xdebug.mode=debug,coverage" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.client_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.client_port=9003" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

COPY . /app
WORKDIR /app

ENTRYPOINT ["php"]