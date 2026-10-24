#!/bin/bash

logs_file=/tmp/exitcodelog.txt

validate(){
    if [ $1 -ne 0 ]; then
        echo " [ERROR] ${2}..FAILED" 
        exit 1
    else
        echo -e " [INFO] ${2}..SUCCESS" 
    fi
}

ls /tmp &>$logs_file
CMD_01=$?
validate $CMD_01 "ls /tmp cmd status"

ls /fakedir &>>$logs_file
CMD_02=$?
validate $CMD_02 "ls /fakedir cmd status"

ping -c1 google.com  &>>$logs_file
CMD_03=$?
validate $CMD_03 "ping cmd status"

