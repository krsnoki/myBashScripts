#!/bin/bash

#packages required : nmcli and ifconfig

SSID=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d ':' -f 2)

IP_ADDRESS=$(ip route get 8.8.8.8 | awk 'NR==1 {print $NF}')
SIGNAL_STRENGTH=$(awk 'NR==3 {print $3}' /proc/net/wireless)



echo "Wi-Fi Information"
echo "-----------------"
echo "SSID: $SSID"
echo "IP Address: $IP_ADDRESS"
echo "Signal Strength: $SIGNAL_STRENGTH dBm"
