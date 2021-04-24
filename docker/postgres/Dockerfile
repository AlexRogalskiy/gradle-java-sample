## example Dockerfile for https://docs.docker.com/engine/examples/postgresql_service/
FROM postgres:12.6

## Updating dependencies list
RUN apt-get update

## Installing build dependencies
RUN apt-get install unzip && apt-get --assume-yes install build-essential wget

## Installing certificate dependencies
RUN apt-get install ca-certificates

## Installing postgresql dependencies
RUN apt-get --assume-yes install postgresql-server-dev-12

## Installing ip4r extension
RUN apt-get install postgresql-12-ip4r

## Installing jobmon extension
RUN wget --no-check-certificate https://github.com/omniti-labs/pg_jobmon/archive/v1.3.3.zip -O pg_jobmon-1.3.3.zip \
	  && unzip pg_jobmon-1.3.3.zip \
	  && cd /pg_jobmon-1.3.3 && make && make install

## Installing partman extension
RUN wget --no-check-certificate https://github.com/pgpartman/pg_partman/archive/v4.4.1.zip -O pg_partman-4.4.1.zip \
  && unzip pg_partman-4.4.1.zip \
  && cd /pg_partman-4.4.1 && pwd && make install && make NO_BGW=1 install

## Running the rest of the commands as the ``postgres`` user created by the "postgres-12" package
USER postgres

## Exposing the PostgreSQL port
EXPOSE 5432

## Adding VOLUMEs to allow backup of config, logs and databases
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]