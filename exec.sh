#!/usr/bin/env bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# ethereum runners
source $DIR/base-runner.sh

NETWORK_REF=$2

if [ "$1" == "start" ]; then
  start-chain $NETWORK_REF
elif [ "$1" == "stop" ]; then
  stop-chain $NETWORK_REF
else
  echo "Invalid operation"
fi
