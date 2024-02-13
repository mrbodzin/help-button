#!/bin/bash
wifi_bus=$(lspci | grep Wireless | awk '{print$ 1}')
echo 1 | sudo tee /sys/bus/pci/devices/0000\:$wifi_bus/remove
echo 1 | sudo tee /sys/bus/pci/rescan
apt-get purge avahi-daemon avahi-autoipd avahi-utils
service NetworkManager restart
nmcli networking off
nmcli networking on
nmcli con delete $(nmcli con show | grep -i wifi | awk '{print $1}')
