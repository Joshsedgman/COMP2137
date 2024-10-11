#!/bin/bash

# this script is intended to provide some system information

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
video_card$(lspci | grep -i vga)

#network Information

fqdn=$(hostname -A)
host_ip_address=$(hostname -I)
gateway_ip=$(ip route | grep default)
dns_server=$(cat /etc/resolv.conf)
network_card_info=$(lspci | grep -i ethernet)
