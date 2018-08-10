#!/usr/bin/env bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
MNEMONIC='fragments.org'
GAS_PRICE=1000000000
BLOCK_GAS_LIMIT=7989556

run-ganache(){
  REFRESH=$1
  NETWORK_REF=$2
  PORT=$3
  echo "Running local ganache network: $NETWORK_REF"

  KEY_DIR=$DIR/config/keystore
  ganache-cli \
    -g $GAS_PRICE \
    -l $BLOCK_GAS_LIMIT \
    -a 10 \
    -m $MNEMONIC \
    --account="0x$(cat $KEY_DIR/key1),1000000000000000000000000" \
    --account="0x$(cat $KEY_DIR/key2),1000000000000000000000000" \
    --account="0x$(cat $KEY_DIR/key3),1000000000000000000000000" \
    --account="0x$(cat $KEY_DIR/key4),1000000000000000000000000" \
    --account="0x$(cat $KEY_DIR/key5),1000000000000000000000000" \
    --account="0x$(cat $KEY_DIR/key6),1000000000000000000000000" \
    --account="0x$(cat $KEY_DIR/key7),1000000000000000000000000" \
    --account="0x$(cat $KEY_DIR/key8),1000000000000000000000000" \
    --account="0x$(cat $KEY_DIR/key9),1000000000000000000000000" \
    --account="0x$(cat $KEY_DIR/key10),1000000000000000000000000" \
    -p $PORT > $DIR/$NETWORK_REF.log &

  echo "Started local ganache chain"
  echo "Network port: $PORT"
  echo "Logging: $DIR/$NETWORK_REF.log"
}
