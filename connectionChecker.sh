#!/bin/bash
#ASK WHETHER OR NOT CONNECTION IS ESTABLISHED
. config.sh

#checks network interface
host_network_interface=$(ip a | awk '/state UP/ {print $2}' | tr -d ':')
host_IP=$(ip a show dev ${host_network_interface} | grep -oP '(?:\b\.?(?:25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){4}' | head -1)

isDesktop=false
isLaptop=false

if [ $host_IP == $DESKTOP_IP ]; then
    echo 'HOST AND DESKTOP ARE THE SAME IP'
    isDesktop=true
elif [ $host_IP == $LAPTOP_IP ]; then
    echo 'HOST AND LAPTOP ARE THE SAME IP'
    isLaptop=true
else
    echo 'Configure your IPs with the config file'
fi