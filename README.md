# Ethereum Runners

This project is collection of bash scripts to run and manage local instances of the Ethereum blockchain,
to deploy and test uFragments contracts. The local instances are instantiated with 10 hardcoded wallets with
1M ETH each at genesis.

## Table of Contents

- [Install](#install)
- [Usage](#usage)
- [Contribute](#contribute)
- [License](#license)

## Install

```bash
# Install dependencies for only unit testing
# Ganache & TestRPC
./bin/setup-local-chains 'lite'

#Install all dependencies
# Ganache, TestRPC & Geth
./bin/setup-local-chains
```

## Usage

```bash
# ./config/network_config.json lists the supported environments.
# network-ref => The network reference is the concatenation of
#                the Ethereum implementation and the local environment.
#                (eg) [ganache + UnitTest] ~ local ganache chain in the UnitTest environment.
# Supported Networks include [ganacheUnitTest|ganacheIntegration|gethUnitTest|gethIntegration|testrpcCoverage]
./bin/start-chain [network-ref]
./bin/stop-chain [network-ref]
```

The 10 hardcoded wallets are [hierarchical deterministic wallets](https://github.com/trufflesuite/truffle-hdwallet-provider) generated with the mnemonic "fragments". To regenerate a different set of 10 hardcoded wallets you can update the `SEED_PHRASE` variable in the `./gen_hd_wallets.js` script and rerun it.

```bash
# Run once and keys are committed (seed=fragments, n=10 hardcoded)
# NOTE: Check-in the updated keys
./gen_hd_wallets.js
```

## Contribute

Currently supports:
* Ganache-CLI (ganache)
* Go Ethereum (geth)

Plans to support:
* Parity

PRs accepted.


## License

[MIT (c) 2018 Fragments, Inc.](./LICENSE)
