FROM huggla/postgis-alpine

COPY ./bin/pre-entry.sh /usr/local/bin/pre-entry.sh

RUN mkdir -p --mode 700 /var/lib/postgresql/data/pgdata \
 && chown varnish:varnish /var/lib/postgresql/data/pgdata \
 && chmod ugo+x /usr/local/bin/pre-entry.sh

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["pre-entry.sh && docker-entrypoint.sh postgres"]
