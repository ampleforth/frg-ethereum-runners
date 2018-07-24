#!/usr/bin/env bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# ethereum runners
source $DIR/ganache-runner.sh
source $DIR/geth-runner.sh

# $1 => Ethereum implementation to start [ganache|geth]
get-network-config(){
  IMPL=$1
  PORT=0
  CHAIN_RNR=99
  if [ "$IMPL" == "ganache" ]; then
    PORT=7550
    CHAIN_RNR=0
  elif [ "$IMPL" == "geth" ]; then
    PORT=8550
    CHAIN_RNR=1
  else
    echo "Invalid implementation"
    exit -1
  fi
  echo "$IMPL" "$PORT" "$CHAIN_RNR"
}

process-pid(){
  lsof -t -i:$1
}

start-appropriate-chain(){
  REFRESH=1
  read IMPL PORT CHAIN_RNR < <(get-network-config $1)
  if [ $CHAIN_RNR == 0 ]; then
    run-ganache $REFRESH $IMPL $PORT
  elif [ $CHAIN_RNR == 1 ]; then
    run-geth $REFRESH $IMPL $PORT
  else
    echo "Invalid blockchain runner"
    exit -1
  fi
}

start-chain(){
  read IMPL PORT CHAIN_RNR < <(get-network-config $1)
  if [ $(process-pid $PORT) ]; then
    echo "Using blockchain running on $PORT"
  else
    echo "Starting blockchain on $PORT"
    start-appropriate-chain $IMPL
  fi
}

stop-chain(){
  read IMPL PORT CHAIN_RNR < <(get-network-config $1)
  echo "Shutting down blockchain on $PORT"
  CHAIN_PID=$(process-pid $PORT)
  if [[ $CHAIN_PID ]]; then
    kill -9 $CHAIN_PID
  fi
}
