# Overview
There are a few components that comprise this system:

|Component|Description|
|---------|-----------|
| Patched QEMU | QEMU 8.2.0 does not have `NETLINK_GENERIC` support as part of its emulation capabilities, which is a requirement of wpa_supplicant, which itself is a dependency of SOMA Connect. This patched version attempts to shakily add support for it by copying the skeleton of `NETLINK_AUDIT`. The provided files are from GhettoForge and for RHEL-based distros; `1000-netlink-generic.patch` is the main component for anyone looking to try this on another distro. |
| soma_connect_2.3.2_armhf | See the link contained within for the SOMA Connect repo. These files should be compiled into a .deb that will be installed as part of the container image creation. |
| spoof_device_model | A simple kernel module pieced together from various sources that presents `/proc/device-tree/model` to the OS. The path is typically present on real Raspberry Pi/similar devices, but not on x86_64 machines. This is a required dependency of the SOMA Connect application, which will error out without it. |
| wlan0.conf, wpa_supplicant.conf | Configuration files for wpa_supplicant. SOMA Connect relies on `wpa_cli` to scan for available WiFi networks to present to the mobile app. |
| Dockerfile, entrypoint.sh | Standard ingredients for building Docker/Podman containers. |

# Commands

On every first boot:

```
podman run --rm --privileged multiarch/qemu-user-static --reset -p yes
```

To build the image:

```
podman build --platform armhf --network=host --tag=soma-connect .
```

# Relevant links

* https://forums.docker.com/t/list-hci-interfaces-with-bluez-hciconfig-fails/136882/4
* https://medium.com/omi-uulm/how-to-run-containerized-bluetooth-applications-with-bluez-dced9ab767f6
* https://stackoverflow.com/questions/28868393/accessing-bluetooth-dongle-from-inside-docker
