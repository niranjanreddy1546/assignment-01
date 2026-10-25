#!/bin/bash

no_of_args=$#

usage(){
    echo -e "USAGE:: $0 [server name]"
    exit 1
}

if [ $no_of_args != 1 ]; then
    echo "These script accepts only one argument"
    usage
fi

echo "========================================"
echo "System Info Report - $1 "
echo "========================================"
echo "Script PID    : " $$
echo "Started at    : " $(date)
echo "User          : " $(whoami)
echo "OS            : " $(cat /etc/os-release | grep PRETTY|awk -F "=" '{print $2}'| tr -d \")
echo "Disk (/)      : " $(df -h / | awk 'NR==2 {print $3 " used of " $2}')
echo "Memory        : " $(free -h --giga | awk '/^Mem:/ {print $3 " used of " $2}')
echo "Uptime        : " $(uptime | awk '{ print $2 " " $3 " " $4 " " $5}')
echo "========================================"
echo "Script completed in $SECONDS seconds"

