# Ethereum Runners
A collection of bash scripts to manage local instances of the Ethereum blockchain.

Currently supports:
* Ganache-CLI (ganache)
* Go Ethereum (geth)

Plans to support:
* Parity

## Install Ethereum implementations
```bash
./bin/setup-local-chains #Install all dependencies
./bin/setup-local-chains 'lite' #Install dependencies for only unit testing
```

## Usage
```bash
./bin/start-chain [network-ref]
./bin/stop-chain [network-ref]
# network-ref => The network reference is the concatenation of the ethereum implementation and the local environment. (eg) [ganache + UnitTest] ~ local ganache chain in the UnitTest environment.
# ./config/network_config.json lists the supported environments.
```

## Test wallets
[HDWallets](https://github.com/trufflesuite/truffle-hdwallet-provider) (Index 0-9) with mnemonic "fragments" and are assigned 1M ETH each at genesis.
```bash
# Run once and keys are committed (seed=fragments, n=10 hardcoded)
# NOTE: Check-in the updated keys
./gen_hd_wallets.js
```
