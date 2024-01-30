FROM ubuntu:22.04
ARG TZ=Europe/Berlin
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y build-essential php8.1 php8.1-dev 
COPY ./src /tmp/build
WORKDIR /tmp/build

RUN phpize
RUN ./configure --enable-ownextension
RUN make
RUN make install

RUN echo 'extension=ownextension.so' > /etc/php/8.1/mods-available/ownextension.ini
RUN phpenmod ownextension

CMD ["php", "-r", "ownfunction(); ownfunctionarg('hello world (args)');"]
