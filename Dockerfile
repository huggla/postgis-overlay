FROM mdillon/postgis:10-alpine

VOLUME /overlay/lowerdir /mnt:/overlay/hostdir

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["mkdir -p /var/lib/postgresql/data/pgdata /overlay/hostdir/`hostname`-upperdir /overlay/hostdir/`hostname`-workdir && mount -t overlay overlay -o lowerdir=/overlay/lowerdir,upperdir=/overlay/hostdir/`hostname`-upperdir,workdir=/overlay/hostdir/`hostname`-workdir /var/lib/postgresql/data/pgdata && docker-entrypoint.sh postgres"]
