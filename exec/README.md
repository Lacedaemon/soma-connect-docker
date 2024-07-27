Ethernet and WiFi devices should be named eth0 and wlan0 respectively, to conform to Raspbian's (as of buster) default naming scheme.

```
ip link set [ethernet/wifi device] name [eth|wlan]0
```

To run the container once built, simply run:

```
[docker/podman]-compose -up -d
```

With the folder containing `docker-compose.yml` as working directory.
