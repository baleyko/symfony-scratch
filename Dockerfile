FROM alpine:edge

RUN  echo "@community https://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
  && apk -U add \
    libressl \
    ca-certificates \
    php7@community \
    php7-openssl@community \
    php7-json@community \
    php7-phar@community \
    php7-mbstring@community \
    php7-ctype@community \
    php7-dom@community \
    php7-session@community \
 && rm -rf /var/cache/apk/* /tmp/*

# RUN ln -s /etc/php7 /etc/php && \
    # ln -s /usr/bin/php7 /usr/bin/php && \
    # ln -s /usr/lib/php7 /usr/lib/php

WORKDIR /app
EXPOSE 80

RUN php -r "echo file_get_contents('https://getcomposer.org/installer');" | php -- --install-dir=/usr/local/bin --filename=composer

COPY . /app
RUN composer install --no-interaction --prefer-dist --no-suggest

RUN echo 1
COPY docker-entrypoint.sh /
RUN chmod a+x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
