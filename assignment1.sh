#!/bin/bash

# this script is intended to provide some system information

USERNAME=$(whoami)
DATETIME=$(date)

# System Information

hostname=$(hostname)
os_info=$(source /etc/os-release && echo "$NAME $VERSION")
Uptime=$(uptime)

#Hardware Information
cpu_info=$(lscpu | grep 'Model name' | awk -F: '{print $2}' | xargs)
CURRENT_CPU_SPEED=$(lscpu | grep 'CPU MHz' | awk '{print $3}') MHz
MAX_CPU_SPEED=$(lscpu | grep 'CPU max MHz' | awk '{print $4}') MHz
TOTAL_RAM=$(free -h | grep 'Mem:' | awk '{print $2}')
DISK_INFO=$(lsblk -d -o NAME,SIZE,MODEL)
VIDEO_CARD$(lspci | grep -i vga)

