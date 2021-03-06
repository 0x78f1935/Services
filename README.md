# Services
Collection of Plug and Play Docker Services.

## Pre-Word
When developing locally I kinda got tired of building a new docker environment for each of my indivual projects. Instead
I just wanted something that works out of the box when I need it. This repository would likely grow overtime. I'm using
this for my personal local development environment and nothing more. If you feel like enhancing the project feel free
to contribute.

## Requirements

`docker` and `docker-compose` are both hard requirements.

### Unix
- [Install docker](https://docs.docker.com/engine/install/debian/)
- [Make a user group and add docker to that group](https://docs.docker.com/engine/install/linux-postinstall/)
- [Install docker-compose](https://docs.docker.com/compose/install/)

### Windows
- [Install docker desktop](https://docs.docker.com/desktop/windows/install/)
- [Make sure WSL2 is configured correctly](https://docs.microsoft.com/en-us/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package)

Once installed check docker version to validate your installation. Open a terminal and type the following:
```
docker --version
```
> Docker version 20.10.14, build a224086

```
docker-compose --version
```
> Docker Compose version v2.5.1

------------------------------------------------------------------------------------------------------------------------

## Run Services
Once docker in installed there is only one command left between you and your service.
```
docker-compose up --build -d SERVICE_NAME
```

`docker-compose` -> executable \
`up` -> command for building and deploying image \
`--build` -> Builds a new image \
`-d` -> Detach deployed container from stdout after build \
`SERVICE_NAME` -> Name of the service

## Services
Available services are:
1. **[freeradius](https://github.com/0x78f1935/Services/blob/master/docs/freeradius/index.md)**
    - [Getting Started](https://github.com/0x78f1935/Services/blob/master/docs/freeradius/getting_started.md)
2. **[openldap](https://github.com/0x78f1935/Services/blob/master/docs/openldap/index.md)**
    - [Getting Started](https://github.com/0x78f1935/Services/blob/master/docs/openldap/getting_started.md)


## Networks
You can attach any existing service network to your project without to much hassle. In this example I'm using 
`docker-compose` to glue the networks together. Where `pytest_3_9` is an imaginary application build that doesn't exist.
```
version: "3.9"
services:
  pytest_3_9:
    restart: on-failure
    container_name: pytest_3_9
    image: pytest_3_9
    hostname: pytest_3_9
    build:
      context: .
      dockerfile: tests/3_9.dockerfile
    ports:
      - 5039:5000
    networks:
      - application
      - services_openldap
    environment:
      - LDAP_HOST=openldap

networks:
  application:
    driver: bridge
  services_openldap:
    external: true
```
Note `services_openldap` which has the option `external`. This allows you to run the service alongside your application.