#!/bin/bash

if [ -z "$1" ]
  then
    echo "No argument passed"
    exit 1
fi

PRIME_STATUS=$(factor $1 | awk '{print $3}')

echo "PRIME_STATUS" $PRIME_STATUS

if [ -z "$PRIME_STATUS" ]; then
    echo "$1 is a prime number!"
else  
    echo "$1 is NOT a prime number"
fi