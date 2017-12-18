FROM huggla/postgis-alpine

COPY ./bin/pre-entry.sh /usr/local/bin/pre-entry.sh

RUN chmod ugo+x /usr/local/bin/pre-entry.sh \
 && mkdir -m 700 /tmp/pgdata \
 && chown postgres:postgres /tmp/pgdata
 
ENV PGDATA /tmp/pgdata

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["pre-entry.sh && docker-entrypoint.sh postgres"]
