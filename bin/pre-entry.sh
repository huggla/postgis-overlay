#!/bin/sh -e

mkdir -p /overlay/hostdir/`hostname`-upperdir \
         /overlay/hostdir/`hostname`-workdir

mount -t overlay overlay -o lowerdir=/overlay/lowerdir,upperdir=/overlay/hostdir/`hostname`-upperdir,workdir=/overlay/hostdir/`hostname`-workdir /var/lib/postgresql/data/pgdata
