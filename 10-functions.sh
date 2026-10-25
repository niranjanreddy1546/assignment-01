#!/bin/bash

user_id=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $user_id -ne 0 ]; then
    echo "Please run this script with sudo access.."
    exit 1
fi

print_header(){
echo "=========================================="
echo "Installing packages"
echo "=========================================="
}

check_status() {
       if [ "$1" -eq 0 ]; then
        echo -e "$(timestamp) [INFO] ${2}..${G}SUCCESS${N}" 
    else
        echo -e "$(timestamp) [ERROR] ${2}..${R}FAILED${N}"
    fi
}

install_package() {
    if command -v "$1" >/dev/null 2>&1; then
        echo "$1 is already installed."
        check_status 0 "$1 validation"
    else
        echo "$1 is missing. Initiating installation..."
        dnf install -y "$1" >/dev/null 2>&1
        check_status $? "$1 installation"
    fi
}

#main
print_header
install_package git
install_package wget
install_package curl
