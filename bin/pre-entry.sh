#!/bin/sh -e

mkdir -p /overlay/hostdir/`hostname`-upperdir \
         /overlay/hostdir/`hostname`-workdir \
         /tmp/pgdata
         
chown postgres:postgres /tmp/pgdata

rm -rf /var/lib/postgresql/data/pgdata

ln -s /tmp/pgdata /var/lib/postgresql/data/

mount -t overlay overlay -o lowerdir=/overlay/lowerdir,upperdir=/overlay/hostdir/`hostname`-upperdir,workdir=/overlay/hostdir/`hostname`-workdir /tmp/pgdata
