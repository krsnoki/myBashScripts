#!/bin/bash

# Get basic system information
HOSTNAME=$(hostname)
KERNEL=$(uname -r)
UPTIME=$(uptime -p)
ARCH=$(arch)

# Get memory information
MEMORY_TOTAL=$(free -h | awk '/Mem:/ {print $2}')
MEMORY_USED=$(free -h | awk '/Mem:/ {print $3}')
MEMORY_FREE=$(free -h | awk '/Mem:/ {print $4}')

# Get disk usage
DISK_USAGE=$(df -h / | awk '/\// {print $5}')

# Get CPU information
CPU_MODEL=$(cat /proc/cpuinfo | grep 'model name' | uniq | cut -d ':' -f 2)
CPU_CORES=$(nproc)
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

# Display system information
echo "System Information"
echo "------------------"
echo "Hostname: $HOSTNAME"
echo "Kernel Version: $KERNEL"
echo "Uptime: $UPTIME"
echo "Architecture: $ARCH"
echo "Memory: Total: $MEMORY_TOTAL, Used: $MEMORY_USED, Free: $MEMORY_FREE"
echo "Disk Usage: $DISK_USAGE"
echo "CPU: Model: $CPU_MODEL"
echo "     Cores: $CPU_CORES"
echo "     CPU Usage: $CPU_USAGE%"

