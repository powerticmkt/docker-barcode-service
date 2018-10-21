FROM powertic/php7.1-build:latest

RUN apt-get update && \
    apt-get install -y \
        libc-client-dev libkrb5-dev && \
    rm -r /var/lib/apt/lists/*

RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
    docker-php-ext-install -j$(nproc) imap

EXPOSE 80

COPY . /var/www/html/
