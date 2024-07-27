FROM debian:bullseye
RUN sed -i -e's/ main/ main contrib non-free/g' /etc/apt/sources.list && \
apt-get update && \
apt-get install -y \
	bluez \
	bluetooth \
	firmware-iwlwifi \
        ifplugd \
	libatomic1 \
        libnl-genl-3-200 \
        openssl \
	sudo \
        strace \
        binutils \
	wpasupplicant && \
rm -rf /var/lib/apt/lists/*

RUN echo "source /etc/network/interfaces.d/*" > /etc/network/interfaces
COPY wlan0.conf /etc/network/interfaces.d/wlan0.conf

COPY wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf

RUN mkdir -p /tmp
COPY soma-connect_2.3.2_armhf.deb /tmp/soma-connect_2.3.2_armhf.deb
RUN dpkg -i /tmp/soma-connect_2.3.2_armhf.deb; rm -rf /tmp/*.deb

RUN ln -s libnl-3 /etc/libnl

COPY entrypoint.sh .
ENTRYPOINT ./entrypoint.sh
