#!/bin/bash

echo "Running as     : " $(whoami)
echo "Directory      : " $(pwd)
echo "Home           : " $HOME
echo "Script PID     : " $$
echo "Background PID : " $!
sleep 10
echo "Random number  : " $(( (RANDOM % 100) + 1 ))
echo "Script ran in $SECONDS seconds"  