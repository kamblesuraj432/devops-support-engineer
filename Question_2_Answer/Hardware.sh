#!/bin/bash

# Server Uptime
echo "Server Uptime:"
uptime

# Last Server Reboot Timestamp
echo "Last Server Reboot Timestamp:"
who -b

# Server Local Time Zone
echo "Server Local Time Zone:"
timedatectl

# Last 10 installed packages with dates
echo "Last 10 installed packages with dates:"
sudo grep "install" /var/log/dpkg.log | tail -n 10

# OS version
echo "OS version:"
sudo cat /etc/os*

# Kernel version
echo "Kernel version:"
sudo uname -r

# CPU - Virtual cores
echo "CPU - Virtual cores, CPU - Clock speed,CPU - Architecture "
lscpu
# or
lscpu | grep -E 'Architecture|CPU\(s\)|MHz' 

# Disk - Mounted/Unmounted volumes, type, storage
echo "Disk - Mounted/Unmounted volumes, type, storage:"
df -h

# Private and Public IP
echo "Private and Public IP:"
hostname -I # Private-IP
sudo dig +short myip.opendns.com @resolver1.opendns.com  # public-IP
# or
# curl ifconfig.me

# Private and Public DNS or Hostname
echo "Private and Public DNS or Hostname:"
hostname
hostname -I

# CPU - Utilization
echo "CPU - Utilization:"
sudo top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d"%" -f1

# RAM - Utilization
echo "RAM - Utilization:"
sudo free | grep Mem | awk '{print $3/$2 * 100.0}'

# Storage
echo "Storage - Utilization:"
sudo df -h --total | tail -n 1 | awk '{print $5}'

# Highlight when current User Password Exipring
echo "Current User Password Expiry:"
sudo chage -l $(whoami) | grep "Password expires"

# Networking - Bandwidth
sudo apt-get install iftop
sudo iftop

# Networking - OS Firewall (Allowed Ports & Protocols)
echo "Networking - OS Firewall (Allowed Ports & Protocols):"
iptables -L -n
