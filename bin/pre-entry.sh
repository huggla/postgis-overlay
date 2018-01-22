#!/bin/bash -e

#Define cleanup procedure
cleanup() {
    echo "Container stopped, performing cleanup..."
    rm -rf /overlay/hostdir/`hostname`-upperdir
    rm -rf /overlay/hostdir/`hostname`-workdir
}

#Trap SIGTERM
trap 'cleanup' SIGTERM

#Execute commands
mkdir -p /overlay/hostdir/`hostname`-upperdir \
         /overlay/hostdir/`hostname`-workdir
mount -t overlay overlay -o lowerdir=/overlay/lowerdir,upperdir=/overlay/hostdir/`hostname`-upperdir,workdir=/overlay/hostdir/`hostname`-workdir /tmp/pgdata \
&& docker-entrypoint.sh postgres &

#Wait
wait $!
