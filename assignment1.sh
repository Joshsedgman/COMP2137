#!/bin/bash

# this script is intended to provide some system information
# I need to add the echo statements below later
username=$(whoami)
datetime=$(date)

# System Information

hostname=$(hostname)
os_info=$(source /etc/os-release && echo "$NAME $VERSION")
Uptime=$(uptime)

#Hardware Information
cpu_info=$(lscpu | grep 'Model name' | awk -F: '{print $2}' | xargs)
current_cpu_speed=$(lscpu | grep 'CPU MHz' | awk '{print $3}') MHz
maximum_cpu_speed=$(lscpu | grep 'CPU max MHz' | awk '{print $4}') MHz
total_ram=$(free -h | grep 'Mem:' | awk '{print $2}')
disk_info=$(lsblk -d -o NAME,SIZE,MODEL)
video_card=$(lspci | grep -i vga)

#network Information

fqdn=$(hostname -A)
host_ip_address=$(hostname -I)
gateway_ip=$(ip route | grep default)
dns_server=$(cat /etc/resolv.conf)
network_card_info=$(lspci | grep -i ethernet)
ip_address_in_CIDR_format=$(hostname -I | awk '{print $1 "/24"}')

#System status

users_logged_in=$(who | awk '{print $1}' | sort -u | paste -sd ',')
disk_space=$(df -h | awk 'NR>1 {print $6 ": " $4}')
process_count=$(pgrep -c .)
load_averages=$(cat /proc/loadavg | awk '{print $1 "," $2 "," $3}')
memory_allocation=$(free -h | awk '/Mem:/ {print "Memory Allocation: Total: " $2 ", Used: " $3 ", Free: " $4}')
listening_network_ports=$(ss -tuln)
ufw_rules=$(ufw status)
