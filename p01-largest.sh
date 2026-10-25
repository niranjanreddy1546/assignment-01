#!/bin/bash

if [ $# -eq 0 ]; then 
    echo "No arguments"; 
    exit 1; 
fi


largest=$(printf "%s\n" "$@" | sort -nr | head -n1)

echo "The largest number is: $largest"
