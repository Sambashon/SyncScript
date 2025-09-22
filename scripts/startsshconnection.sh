#!/bin/bash
. "$(dirname "$0")/connectionChecker.sh"
echo $device

if [ "$connectionSuccessful" == "true" ]; then
    if [ "$device" == "desktop" ]; then
        ssh ${LAPTOP_USER}@${LAPTOP_IP}
    elif [ "$device" == "laptop" == "true" ]; then
        ssh ${DESKTOP_USER}@${DESKTOP_IP}
    fi
else
    echo "Error"
    exit 1
fi