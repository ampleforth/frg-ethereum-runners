#!/usr/bin/env bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
GAS_PRICE=1000000000
frg-geth(){
  geth --networkid 9000 \
   --maxpeers 0 \
   --nodiscover \
   --gasprice $GAS_PRICE \
   --rpc \
   --rpccorsdomain "*" \
   --ws \
   --wsorigins "*" \
   --nat "any"  \
   --verbosity 2 \
   --rpcapi="db,eth,net,web3,personal,test" \
   --wsapi="db,eth,net,web3,personal,test" \
   --etherbase "3b2b9efdae5291f3bb9c7e6508c7e67534511585" \
   "$@"
}

run-geth(){
  REFRESH=$1
  NETWORK_REF=$2
  PORT=$3
  echo "Running local geth network: $NETWORK_REF"

  CHAIN_DATA=$DIR/chain_data_$NETWORK_REF
  KEY_DIR=$DIR/config/keystore
  if [ $REFRESH == 1 ]; then
    rm -rf $CHAIN_DATA
    echo "Cleaning up: $CHAIN_DATA"
  fi
  echo "Saving blockchain data at: $CHAIN_DATA"

  echo "Setting up wallets and private keys for testing"
  frg-geth account import --datadir $CHAIN_DATA --password $KEY_DIR/password.txt $KEY_DIR/key1
  frg-geth account import --datadir $CHAIN_DATA --password $KEY_DIR/password.txt $KEY_DIR/key2
  frg-geth account import --datadir $CHAIN_DATA --password $KEY_DIR/password.txt $KEY_DIR/key3
  frg-geth account import --datadir $CHAIN_DATA --password $KEY_DIR/password.txt $KEY_DIR/key4
  frg-geth account import --datadir $CHAIN_DATA --password $KEY_DIR/password.txt $KEY_DIR/key5
  frg-geth account import --datadir $CHAIN_DATA --password $KEY_DIR/password.txt $KEY_DIR/key6
  frg-geth account import --datadir $CHAIN_DATA --password $KEY_DIR/password.txt $KEY_DIR/key7
  frg-geth account import --datadir $CHAIN_DATA --password $KEY_DIR/password.txt $KEY_DIR/key8
  frg-geth account import --datadir $CHAIN_DATA --password $KEY_DIR/password.txt $KEY_DIR/key9
  frg-geth account import --datadir $CHAIN_DATA --password $KEY_DIR/password.txt $KEY_DIR/key10

  GENESIS_CONFIG=$DIR/config/genesis.json
  frg-geth --datadir $CHAIN_DATA \
    --identity $NETWORK_REF \
    init $GENESIS_CONFIG
  echo "Using keystore: $KEY_DIR"
  echo "Initialized local geth chain using: $GENESIS_CONFIG"

  frg-geth --datadir $CHAIN_DATA \
     --unlock "0,1,2,3,4,5,6,7,8,9" --password $KEY_DIR/password.txt \
     --identity $NETWORK_REF \
     --port $((PORT-1)) \
     --rpcport $((PORT)) \
     --wsport $((PORT+1)) \
     --mine 1 console 2> $DIR/$NETWORK_REF.log &
  echo "Started local geth chain"
  echo "Network port: $((PORT-1))"
  echo "RPC HTTP port: $((PORT))"
  echo "RPC WS port: $((PORT+1))"
  echo "Logging: $DIR/$NETWORK_REF.log &"
}
