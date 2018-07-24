#!/usr/bin/env bash
# usage: ./exec.sh [start|stop] [ganache|geth]
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# ethereum runners
source $DIR/base-runner.sh

IMPL=$2

if [ "$1" == "start" ]; then
  start-chain $IMPL
fi

if [ "$1" == "stop" ]; then
  stop-chain $IMPL
fi
