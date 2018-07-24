#!/usr/bin/env bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# ethereum runners
source $DIR/ganache-runner.sh
source $DIR/geth-runner.sh

# $1 => Reference to local ethereum network [ganacheUnitTest|ganacheDev|gethUnitTest|gethDev]
get-network-config(){
  NETWORK_REF=$1
  PORT=0
  CHAIN_RNR=99

  if [[ $NETWORK_REF = "ganache"* ]]; then
    CHAIN_RNR=0
  elif [[ $NETWORK_REF = "geth"* ]]; then
    CHAIN_RNR=1
  fi

  if [ "$NETWORK_REF" == "ganacheDev" ]; then
    PORT=7545
  elif [ "$NETWORK_REF" == "gethDev" ]; then
    PORT=7550
  elif [ "$NETWORK_REF" == "ganacheUnitTest" ]; then
    PORT=8545
  elif [ "$NETWORK_REF" == "gethUnitTest" ]; then
    PORT=8550
  fi

  echo "$NETWORK_REF" "$PORT" "$CHAIN_RNR"
}

process-pid(){
  lsof -t -i:$1
}

start-appropriate-chain(){
  REFRESH=1
  read NETWORK_REF PORT CHAIN_RNR < <(get-network-config $1)
  if [ $CHAIN_RNR == 0 ]; then
    run-ganache $REFRESH $NETWORK_REF $PORT
  elif [ $CHAIN_RNR == 1 ]; then
    run-geth $REFRESH $NETWORK_REF $PORT
  elif [ $CHAIN_RNR == 99 ]; then
    echo "Invalid ethereum environment"
    exit -1
  fi
}

start-chain(){
  read NETWORK_REF PORT CHAIN_RNR < <(get-network-config $1)
  if [ $(process-pid $PORT) ]; then
    echo "Using blockchain running on $PORT"
  else
    start-appropriate-chain $NETWORK_REF
    echo "Started blockchain on $PORT"
  fi
}

stop-chain(){
  read NETWORK_REF PORT CHAIN_RNR < <(get-network-config $1)
  CHAIN_PID=$(process-pid $PORT)
  if [[ $CHAIN_PID ]]; then
    kill -9 $CHAIN_PID
    echo "Shutdown blockchain on $PORT"
  fi
}
