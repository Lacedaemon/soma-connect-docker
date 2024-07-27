#!/bin/sh

# Add the below to enable STRACE for debugging:
# -e QEMU+STRACE=1 \

podman run -it \
  --name soma-connect \
  --memory 512M \
  --device /dev/rfkill:/dev/rfkill \
  --network host \
  --volume /proc/device-tree:/proc/device-tree:ro \
  --volume /opt/soma/Docker/data/var/soma-connect:/var/soma-connect \
  --volume /run/dbus:/run/dbus:ro \
  --volume /var/lib/bluetooth:/var/lib/bluetooth:ro \
  --volume /lib/modules:/lib/modules:ro \
  --restart=unless-stopped \
  --cap-add NET_ADMIN \
  --cap-add NET_RAW \
  --cap-add AUDIT_WRITE \
  --cap-add SYSLOG \
  --cap-add SYS_RAWIO \
  --entrypoint /bin/bash \
  localhost/soma-connect
