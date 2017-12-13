FROM huggla/postgis-alpine

COPY ./bin/pre-entry.sh /usr/local/bin/pre-entry.sh

RUN chmod ugo+x /usr/local/bin/pre-entry.sh

WORKDIR /var/lib/postgresql/data/pgdata

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["pre-entry.sh && docker-entrypoint.sh postgres"]
