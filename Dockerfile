FROM php:7.4-cli

# init apt
RUN apt update && apt upgrade -y

# install software
RUN apt install -y git zip unzip curl

# install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('sha384', 'composer-setup.php') === 'c31c1e292ad7be5f49291169c0ac8f683499edddcfd4e42232982d0fd193004208a58ff6f353fde0012d35fdd72bc394') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php --install-dir=/bin \
    && php -r "unlink('composer-setup.php');" \
    && echo 'php /bin/composer.phar "$@"' > /bin/composer \
    && chmod a+x /bin/composer
