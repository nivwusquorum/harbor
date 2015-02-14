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

source $SCRIPT_DIR/docker_remove_containers.sh

docker run -d -p=6379:6379 --name=harbor-redis harbor/redis

