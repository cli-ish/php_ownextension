# PHP Extension Template

just a small little template to be able to create php extensions for a ctf if required.

## Setup

```
apt-get update && apt-get install -y build-essential php8.1 php8.1-dev 
cd ./src
phpize
./configure --enable-php-ownextension
make
make install
php -d extension=php_ownextension.so -r "ownfunction(); ownfunctionarg('hello world (args)');"
```

## Docker

```
docker build -t ownphpextension .
docker run -it ownphpextension:latest
```
