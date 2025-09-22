#!/bin/bash
opc=""
while [ "$opc" != 2 ]; do
    echo "SyncScript MENU!"
    echo "1. Connect to your other computer via SSH"
    echo "0. Exit"
    read -p "Enter your desired option" opc

    case "$opc" in
        1)
        "$(dirname "$0")/startsshconnection.sh"
        ;;
        
        0)
            echo "So long gay bowser!"
            exit 0;
        ;;
        *)
            echo "Invalid option"
    esac
done