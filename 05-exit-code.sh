#!/bin/bash

logs_file=/tmp/exitcodelog.txt

validate(){
    if [ $1 -ne 0 ]; then
        echo " [ERROR] ${2}..FAILED" 
        
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

if [ $CMD_01 -ne 0 ] || [ $CMD_02 -ne 0 ] || [ $CMD_03 -ne 0 ];  then
    echo " [ERROR] One of the above 3 command..FAILED , Exiting with code 1" 
    exit 1
else  
    echo -e " [INFO] all 3 commands..SUCCESS" 
fi
