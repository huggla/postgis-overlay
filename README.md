# postgis-overlay

1. Mount a volume, containing the postgis data template, on /overlay/lowerdir.
2. Mount /mnt from the host on /overlay/hostdir.

### Capabilities
Needs SYS_ADMIN, CHOWN, DAC_OVERRIDE, FOWNER, FSETID, SETGID, SETUID.
Other capabilities can be dropped.
