# Usgard

```
_____  __                            _________
__  / / /_____________ ______ _____________  /
_  / / /__  ___/_  __ `/  __ `/_  ___/  __  /
/ /_/ / _(__  )_  /_/ // /_/ /_  /   / /_/ /
\____/  /____/ _\__, / \__,_/ /_/    \__,_/

```

> Asgard is located in the sky and is connected to Midgard, the world of humanity, by the rainbow bridge Bifrost - Norse-Mythology.org


## Overview
Usgard(Us + Asgard) is responsible for show status(like temperature, luminosity...) and execute commands (turn on the light, for example) through the Bitfrost.

![alt text](http://gabrielmalakias.com.br/assets/images/usgard_perspective.png "Usgard")

## Dependencies
* Ruby(2.4.0)
* Hanami(1.0.0-beta1)
* Postgres(9.6)
* Redis(3.2)
* Docker-compose version 1.8.1(optional)

## Running application

``` sh
./script/server
```

## Running tests
``` sh
./script/test
```

## Monitoring stats
``` sh
docker stats --format "table {{.Container}}\t{{.Name}}\t{{.MemUsage}}\t{{.CPUPerc}}\t{{.NetIO}}\t{{.BlockIO}}"
```

## Maintainers
[Gabriel Malaquias](mailto:gabriel07malakias@gmail.com)
