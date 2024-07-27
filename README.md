# soma-connect-x86_64-docker

This is an attempt to run SOMA Connect on x86_64 hardware by leveraging QEMU and Docker/Podman.

I was able to get as far as getting the application to start up; however something is causing it to shut down as soon as it goes through its initialization hoops. I suspect that it's due to my jank attempt to hack `NETLINK_GENERIC` support into QEMU (which as of version 8.2.0 is not natively supported), in order to get wpa_supplicant somewhat functioning.

A brief overview of each folder:

|Folder|Description|
|------|-----------|
| `exec` | This folder has everything needed to run the container. |
| `src`  | This folder has everything needed to build the container. |
