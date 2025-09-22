#!/bin/bash
#ASK WHETHER OR NOT CONNECTION IS ESTABLISHED
. "$(dirname "$0")/config.sh"

#Get the first non-loopback IPv4 address
host_IP=$(ip -4 addr show scope global | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -1)
echo "Host IP: $host_IP"
echo "Desktop IP: $DESKTOP_IP"
echo "Laptop IP: $LAPTOP_IP"

device="null"
if [ "$host_IP" = "$DESKTOP_IP" ]; then
    device='desktop'
    echo $device
elif [ "$host_IP" = "$LAPTOP_IP" ]; then
    device='laptop'
    echo $device
else
    echo 'Configure your IPs with the config file'
    exit 1
fi

#check if the ips are detected
connectionSuccessful=false

if [ "$device" == "desktop" ]; then
    ping -c 4 $LAPTOP_IP
    if [ $? -eq 0 ]; then #asks the last run command whether or not it was successful
        echo "Connection successful."
        connectionSuccessful="true"
    else
        echo "Connection failed. Could not find host"
    fi
elif [ "$device" == "laptop" ]; then
    ping -c 4 $DESKTOP_IP
    if [ $? -eq 0 ]; then
        echo "Connection successful."
        connectionSuccessful="true"
    else
        echo "Connection failed. Could not find host"
    fi
fi