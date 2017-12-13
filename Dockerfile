FROM huggla/postgis-alpine:20171213

COPY ./bin/pre-entry.sh /usr/local/bin/pre-entry.sh

RUN chmod ugo+x /usr/local/bin/pre-entry.sh

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["pre-entry.sh && docker-entrypoint.sh postgres"]
