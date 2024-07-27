#!/bin/bash

# start wpa_supplicant
wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf

# start application
/usr/lib/soma-connect/soma-connect

