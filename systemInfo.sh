#!/bin/bash

# Display hostname
echo "Hostname: $(hostname)"

# Display IP address
echo "IP Address: $(hostname -I | awk '{print $1}')"

# Display Gateway IP address
echo "Gateway IP: $(ip route | grep default | awk '{print $3}')"
