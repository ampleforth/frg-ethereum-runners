#!/usr/bin/env bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

install-geth-linux(){
  sudo add-apt-repository -y ppa:ethereum/ethereum
  sudo apt-get update -q
  sudo apt-get install ethereum
}

install-geth-osx(){
  brew tap ethereum/ethereum
  brew install ethereum
}

install-geth(){
  if [[ "$OSTYPE" = "linux-gnu" ]]; then
    install-geth-linux
  elif [[ "$OSTYPE" = "darwin"* ]]; then
    install-geth-osx
  fi
}

bash $DIR/lite-dep-install.sh

echo "------Installing zos"
npm install -g zos@1.1.0

echo "------Installing geth"
install-geth
