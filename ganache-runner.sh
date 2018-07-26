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

  ganache-cli \
    -g $GAS_PRICE \
    -l $BLOCK_GAS_LIMIT \
    -a 10 \
    -m $MNEMONIC \
    --account="0x689111e38453e6fc7a385307754fa34e9e62ed3795f860b6db8137517c234081,1000000000000000000000000" \
    --account="0x777d5e5ebea798fe964a0b124d3efd5ecb9382e1e3928d3df5075529a8785168,1000000000000000000000000" \
    --account="0xb28c186e30fe41dfde5c1c43fd98def3f908a67b09cee77084d93f32da159264,1000000000000000000000000" \
    --account="0x319d4335baacadd2aab6fa6593901b3fac3043df24a9e590e464ad223a35f104,1000000000000000000000000" \
    --account="0xa7534ee7aa1649eac1ac53bd3f3bdccfef26d1526bdd5c618d109d4670034fb1,1000000000000000000000000" \
    --account="0x18dcea79693b92fc00f88481314773acd5caf839dea9233bcd7a47f578c8409f,1000000000000000000000000" \
    --account="0x69b716749e18a50fbbde8d75694d07d69f051529eaa4bffb60793054e976ffce,1000000000000000000000000" \
    --account="0x680ac9fc4d3bb1630bc99a811c404b31596e243df4876037ef2abb70fb0c37af,1000000000000000000000000" \
    --account="0x4c083e86671af6355aa1b08637656c4792367875fb69aa4b4cad7fbaaa4bfb31,1000000000000000000000000" \
    --account="0x3e65f207539de55a9bddce4737c7248d231648bdeec522f065fe68bb7ab9b3f6,1000000000000000000000000" \
    -p $PORT > $DIR/logs/$NETWORK_REF.log &

  echo "Started local ganache chain"
  echo "Network port: $PORT"
  echo "Logging: $DIR/logs/$NETWORK_REF.log"
}
