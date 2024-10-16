#!/bin/bash

# this script's purpose it to provide some information about the system such as the hardware, software and more

# these commands are to get the username and the date/time
username=$(whoami)
datetime=$(date)

# System Information
hostname=$(hostname)
# the command below will get the OS name and version
os_info=$(source /etc/os-release && echo "$NAME $VERSION")
#this command below will get the system uptime
Uptime=$(uptime -p)

# Hardware Information
#the command below gets the CPU model
cpu_info=$(lscpu | grep "Model name")
current_cpu_speed=$(cat /proc/cpuinfo | grep 'cpu MHz' | awk '{print $4}' | head -n 1)
maximum_cpu_speed=$(grep 'cpu MHz' /proc/cpuinfo | sort -u | awk 'END {print $4}')
total_ram=$(free -h | grep 'Mem:' | awk '{print $2}')
disk_info=$(lsblk -o NAME,SIZE,MODEL)
video_card=$(lspci | grep -i vga)

# Network Information
# this command below gets the Fully Qualified Domain Name
fqdn=$(hostname -A)
host_ip_address=$(hostname -I | awk '{print $1}')
gateway_ip=$(ip route | grep default | awk '{print $3}')
dns_server=$(cat /etc/resolv.conf | awk '{print $2}')
network_card_info=$(lspci | grep -i ethernet)
ip_address_in_CIDR_format=$(hostname -I | awk '{print $1 "/24"}')

# System Status
users_logged_in=$(who | awk '{print $1}' | sort -u | paste -sd ',')
disk_space=$(df -h)
# the command below is to count the running processes
process_count=$(pgrep -c .)
load_averages=$(cat /proc/loadavg | awk '{print $1 "," $2 "," $3}')
memory_allocation=$(cat /proc/meminfo)
listening_network_ports=$(ss -tuln)
# you will probably need to run 'sudo' to view the ufw status
ufw_rules=$(sudo ufw status)

# This is the output

cat <<EOF

System Report generated by $username, $datetime

System Information
------------------
Hostname: $hostname
OS: $os_info
Uptime: $Uptime

Hardware Information
--------------------
CPU: $cpu_info
Speed: $current_cpu_speed MHz / $maximum_cpu_speed MHz
RAM: $total_ram
Disk(s): $disk_info
Video: $video_card

Network Information
-------------------
FQDN: $fqdn
Host Address: $host_ip_address
Gateway IP: $gateway_ip
DNS Server: $dns_server

Network Interface: $network_card_info
IP Address (CIDR): $ip_address_in_CIDR_format

System Status
-------------
Users Logged In: $users_logged_in
Disk Space: $disk_space
Process Count: $process_count
Load Averages: $load_averages
Memory Allocation: $memory_allocation
Listening Network Ports: $listening_network_ports
UFW Rules:
$ufw_rules

EOF
