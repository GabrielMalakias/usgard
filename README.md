# Usgard

## Overview
> The Hanami application to show status(like temperature, luminosity...) and execute commands (turn on the light, for example) through a MQTT server.

![alt text](http://gabrielmalakias.com.br/assets/images/usgard_perspective.png "Usgard")


## Dependencies
* Ruby(2.4.0)
* Hanami(1.0.0)
* Postgres(9.6)
* Redis(3.2)
* Docker-compose version 1.8.1(optional)

## Running mqtt server

``` sh
docker run -ti -p 1883:1883 -p 9001:9001 toke/mosquitto
```

## Maintainers
[Gabriel Malaquias](mailto:gabriel07malakias@gmail.com)
