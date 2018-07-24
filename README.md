# Ethereum Runners
A collection of bash scripts to manage local instances of the Ethereum blockchain.

Currently supports:
* Ganache-CLI
* Go Ethereum

Plans to support:
* Parity

## Install Ethereum implementations
```bash
# Install ganache
npm install -g ganache-cli

# Install geth (https://github.com/ethereum/go-ethereum/wiki/Installation-Instructions-for-Mac)
brew tap ethereum/ethereum
brew install ethereum
```

## Usage
```bash
# usage: ./exec.sh [ganache|geth] [start|stop]
```
