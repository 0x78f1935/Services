FROM osixia/openldap:stable

COPY ./services/openldap/configuration/default.yaml /container/environment/99-default/default.yaml