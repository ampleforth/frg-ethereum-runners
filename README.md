# Ethereum Runners
A collection of bash scripts to manage local instances of the Ethereum blockchain.

Currently supports:
* Ganache-CLI (ganache)
* Go Ethereum (geth)

Plans to support:
* Parity

## Install Ethereum implementations
```bash
./dep-install.sh # Install dependencies locally
./ci-dep-install.sh #Install dependencies on TRAVIS
```

## Usage
```bash
./exec.sh [start|stop] [network-ref]
# network-ref => The network reference is the concatenation of the ethereum implementation and the local environment. (eg) [ganache + UnitTest] ~ local ganache chain in the UnitTest environment.
# config/network_config.json lists the supported environments.
```

## Test accounts
Test accounts (`./config/accounts.json`) are generated as [HDWallets](https://github.com/trufflesuite/truffle-hdwallet-provider) (Index 0-9) with mnemonic "fragments" and are assigned 1M ETH each at genesis.
