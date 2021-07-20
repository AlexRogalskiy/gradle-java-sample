FROM boxfuse/flyway:latest

RUN apt-get update && \
    apt-get install -y postgresql-client && \
    mkdir /flyway/bin

ADD scripts/wait-for-db.sh /flyway/bin/wait-for-db.sh

RUN chmod 755 /flyway/bin/wait-for-db.sh