# Ethereum Runners
A collection of bash scripts to manage local instances of the Ethereum blockchain.

Currently supports:
* Ganache-CLI (ganache)
* Go Ethereum (geth)

Plans to support:
* Parity

## Install Ethereum implementations
```bash
./dep-install.sh
```

## Usage
```bash
./exec.sh [start|stop] [network-ref]
# network-ref => The network reference is the concatenation of the ethereum implementation and the local environment. (eg) [ganache + UnitTest] ~ local ganache chain in the UnitTest environment.
# config/network_config.json lists the supported environments.
```
