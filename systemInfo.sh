#!/bin/bash

# Display the hostname
echo "Hostname: $(hostname)"

# Display the IP address
echo "IP Address: $(hostname -I | awk '{print $1}')"

# Display the Gateway IP address
echo "Gateway IP: $(ip route | grep default | awk '{print $3}')"
