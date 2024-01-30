# PHP Extension Template

just a small little template to be able to create php extensions for a ctf if required.

## Setup

```
apt-get update && apt-get install -y build-essential php8.1 php8.1-dev 
cd ./src
phpize
./configure --enable-ownextension
make
make install

echo 'extension=ownextension.so' > /etc/php/8.1/mods-available/ownextension.ini
phpenmod ownextension

php -r "ownfunction(); ownfunctionarg('hello world (args)');"
```

## Docker

*Testing*
```
docker build -t ownphpextension .
docker run -it ownphpextension:latest
```

*Debugging*
```
docker build -f Dockerfile.debug -t ownphpextension-debug .
docker run -it ownphpextension-debug:latest
```
