#!/bin/bash

# Check if the script is being run with sudo
if [ "$EUID" -ne 0 ]; then
    echo "Please run the script with sudo."
    exit 1
fi

# Define the status file path
status_file="/etc/zerotier-status"

# Create the status file if it doesn't exist
if [ ! -f "$status_file" ]; then
    echo "unknown" | sudo tee "$status_file" >/dev/null
fi

# Function to get the ZeroTier interface
get_zerotier_interface() {
    zerotier-cli listnetworks | awk '{print $8}' | grep -v "Interface" | grep -oE "zt\w+"
}

# Function to bring up the ZeroTier interface
zerotier_up() {
    #interface=$(zerotier-cli listnetworks | awk '{print $8}' | grep -v "Interface")
    interface=$(get_zerotier_interface)
    sudo ip link set "$interface" up
    echo "up" | sudo tee "$status_file" >/dev/null
    echo "ZeroTier interface $interface is now up."
}

# Function to bring down the ZeroTier interface
zerotier_down() {
    #interface=$(zerotier-cli listnetworks | awk '{print $8}' | grep -v "Interface")
    interface=$(get_zerotier_interface)
    sudo ip link set "$interface" down
    echo "down" | sudo tee "$status_file" >/dev/null
    echo "ZeroTier interface $interface is now down."
}

# Function to check the status of the ZeroTier interface
zerotier_status() {
    status=$(cat "$status_file")
    echo "ZeroTier interface status: $status"
}

# Check the command line argument
case "$1" in
    up)
        zerotier_up
        ;;
    down)
        zerotier_down
        ;;
    status)
        zerotier_status
        ;;
    *)
        echo "Usage: $0 {up|down|status}"
        exit 1
        ;;
esac
