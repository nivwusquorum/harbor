#!/bin/bash

# Stop on error
set -e
# Stop when undefined variable is ecountered
set -u
# Easier to debug errors
set -o pipefail

function cleanup {
	# this function is executed when script exits
	# regardless of reason (error, no error etc.)
	echo
}
trap cleanup EXIT

# Ensure root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi


newhostname=${1:-}
if [[ -z "$newhostname" ]]
then
	echo "Usage S0 NEWHOSTNAME"
	exit 1
fi


cp scripts/.bashrc ~/.bashrc
usermod -a -G dockerroot $USER
echo $newhostname > /etc/hostname

echo done
