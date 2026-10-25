#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

user_id=$(id -u)
logs_file=/tmp/$1-install_log.txt

if [ $user_id -ne 0 ]; then
    echo "Please run this script with sudo access.."
    exit 1
fi

timestamp(){
    date "+%F %T" 
}

validate(){
    if [ $1 -ne 0 ]; then
        echo -e "$(timestamp) [ERROR] ${2}..${R}FAILED${N}" | tee -a $logs_file
        exit 1
    else
        echo -e "$(timestamp) [INFO] ${2}..${G}SUCCESS${N}" | tee -a $logs_file
    fi
}

if command -v $1 >/dev/null 2>&1; then
    echo "$1 is already installed"
    $1 -v
    exit 0
else
    echo "$1 not found, Installing now."
    dnf install $1 -y &>$logs_file
    validate $? "Installing $1"
fi