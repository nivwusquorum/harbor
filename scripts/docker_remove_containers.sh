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

	# do nothing
	exit $?
}
trap cleanup EXIT


SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
HARBOR_DIR=$(dirname $SCRIPT_DIR)


for container in harbor-redis
do
	# ignore errors - errors here mean that nothing was running
	# but that's fine.
	docker stop $container > /dev/null 2>&1  || echo "WARNING: $container not running."
	docker rm $container > /dev/null 2>&1   || echo "WARNING: $container not listed."
done
