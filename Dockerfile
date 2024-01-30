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

# Probably the stupidest way to add it to the list of php extensions :D
RUN echo 'extension=php_ownextension.so' > /etc/php/8.1/mods-available/php_ownextension.ini
RUN phpenmod php_ownextension

CMD ["php", "-r", "ownfunction(); ownfunctionarg('hello world (args)');"]
