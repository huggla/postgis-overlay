# postgis-overlay
This image can be used to scale up an existing database. 

1. Mount a volume, containing the postgis data template, on /overlay/lowerdir.
2. Mount /mnt from the host on /overlay/hostdir.
3. Mount an empty directory from the host on /var/lib/postgresql/data to prevent creation of an unnecessary volume. 

### Capabilities
Needs SYS_ADMIN, CHOWN, DAC_OVERRIDE, FOWNER, SETGID, SETUID.
Other capabilities can be dropped.
