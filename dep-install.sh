#!/usr/bin/env bash
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

echo "------Setting up environment"

echo "------Installing truffle"
npm install -g truffle@4.1.13

echo "------Installing zos"
npm install -g zos@1.1.0

echo "------Installing ganache"
npm install -g ganache-cli@6.1.0

echo "------Installing geth"
install-geth
