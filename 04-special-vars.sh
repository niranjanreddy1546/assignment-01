#!/bin/bash

echo "Running as     : " $(whoami)
echo "Directory      : " $(pwd)
echo "Home           : " $HOME
echo "Script PID     : " $$
sleep 10 &
echo "Background PID : " $!
wait $!
echo "Random number  : " $(( (RANDOM % 100) + 1 ))
echo "Script ran in $SECONDS seconds"  