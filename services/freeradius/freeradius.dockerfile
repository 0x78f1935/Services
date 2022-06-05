FROM freeradius/freeradius-server:3.2.0-alpine

COPY ./services/freeradius/configuration/ /etc/raddb/
