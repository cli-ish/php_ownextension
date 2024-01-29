FROM ubuntu:22.04
ARG TZ=Europe/Berlin
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y build-essential php8.1 php8.1-dev 
COPY ./src /tmp/build
WORKDIR /tmp/build

RUN phpize
RUN ./configure --enable-php-ownextension
RUN make
RUN make install

CMD ["php", "-d", "extension=php_ownextension.so", "-r", "ownfunction(); ownfunctionarg('hello world (args)');"]
