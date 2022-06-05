# Getting Started

## 1 ) Configure your instance
Configuration files can be modified / placed inside `services/openldap/configuration`. Once the docker container build
the configuration will be placed inside the container located at `/container/environment/99-default`.

Refer to [available configurations](https://github.com/osixia/docker-openldap#environment-variables).

## 2 ) Starting your instance
Assuming docker is correctly configured. Execute the following command in the directory of the `docker-compose.yml` file.
```
docker-compose up --build -d openldap
```
`docker-compose` -> executable \
`up` -> command for building and deploying image \
`--build` -> Builds a new image \
`-d` -> Detach deployed container from stdout after build \
`openldap` -> Name of the service
