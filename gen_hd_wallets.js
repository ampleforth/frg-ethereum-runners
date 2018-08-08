#!/usr/bin/env node
const APP_ROOT = require('app-root-path');
const bip39 = require("bip39");
const hdkey = require('ethereumjs-wallet/hdkey');
const fs = require('fs');

const SEED_PHRASE = "fragments";
const NUM_ADDRESSES = 10;

const hdwallet = hdkey.fromMasterSeed(bip39.mnemonicToSeed(SEED_PHRASE));
const wallet_hdpath = "m/44'/60'/0'/0/";

fs.unlinkSync(`${APP_ROOT}/config/keystore/password.txt`);
for (let i = 0; i < NUM_ADDRESSES; i++) {
  const wallet = hdwallet.derivePath(wallet_hdpath + i).getWallet();
  const addr = '0x' + wallet.getAddress().toString('hex');
  fs.writeFileSync(`${APP_ROOT}/config/keystore/wallet${i+1}`, addr);
  fs.writeFileSync(`${APP_ROOT}/config/keystore/key${i+1}`, wallet._privKey.toString('hex'));
  fs.appendFileSync(`${APP_ROOT}/config/keystore/password.txt`, SEED_PHRASE + "\n");
};
