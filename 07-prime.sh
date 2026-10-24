#!/bin/bash

if [ -z "$1" ]
  then
    echo "No argument passed"
fi

PRIME_STATUS=$(factor $1 | awk '{print $3}')

echo "PRIME_STATUS" $PRIME_STATUS
