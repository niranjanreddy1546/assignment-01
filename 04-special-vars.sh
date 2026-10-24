#!/bin/bash

echo "Running as     : " $(whoami)
echo "Directory      : " $(pwd)
echo "Home           : " $HOME
echo "Script PID     : " $$
echo "Background PID : " $!
echo "Random number  : " $RANDOM
echo "Script ran in $SECONDS seconds"  