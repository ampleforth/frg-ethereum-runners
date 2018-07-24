#!/usr/bin/env bash
# usage: ./exec.sh [ganache|geth] [start|stop]
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# ethereum runners
source $DIR/base-runner.sh

IMPL=$1

if [ "$2" == "start" ]; then
  start-chain $IMPL
fi

if [ "$2" == "stop" ]; then
  stop-chain $IMPL
fi
