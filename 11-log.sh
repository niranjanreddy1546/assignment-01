#!/bin/bash

success_file=/tmp/script.log
error_file=/tmp/script-errors.log

>$success_file
>$error_file

ls /tmp 1>>$success_file 2>>$error_file  
ls /fakedir 1>>$success_file 2>>$error_file  
$(date) 1>>$success_file 2>>$error_file  

echo  "Content of success file :  "
cat $success_file

echo "Content of error file : "
cat $error_file