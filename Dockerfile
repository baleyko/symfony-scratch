FROM alpine:edge

RUN  echo "@community https://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
  && apk -U add \
    libressl \
    ca-certificates \
    php8@community \
    php8-openssl@community \
    php8-json@community \
    php8-phar@community \
    php8-mbstring@community \
    php8-ctype@community \
    php8-tokenizer@community \
    php8-dom@community \
    php8-xml@community \
    php8-session@community \
 && rm -rf /var/cache/apk/* /tmp/*

WORKDIR /app
EXPOSE 80

RUN php -r "echo file_get_contents('https://getcomposer.org/installer');" | php -- --install-dir=/usr/local/bin --filename=composer

COPY . .
RUN composer install --no-interaction --prefer-source --no-suggest

COPY docker-entrypoint.sh /
RUN chmod a+x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
