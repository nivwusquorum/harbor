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

docker build -t harbor/redis $HARBOR_DIR/docker/harbor-redis
