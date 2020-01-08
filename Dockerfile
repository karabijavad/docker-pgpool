FROM ubuntu:18.10

RUN apt-get update && \
    apt-get install -y wget gnupg2 ca-certificates 

RUN echo deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main > /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get update && \
    apt-get install -y \
        pgpool2 libmemcached11 libssl1.1 \
        postgresql-client

ADD docker-entrypoint.sh /usr/local/bin/
RUN ln -s /usr/local/bin/docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 8000
