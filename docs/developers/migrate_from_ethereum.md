# How to migrate dApps from Ethereum to TomoChain?

## What’s Ethereum dApp?

Ethereum dApps build on Ethereum blockchain technology, where Ethereum serves as the back-end for the application.
One of the most popular dApps — cryptokitties, is collectibles-style game built on Ethereum. When we build a game with Ethereum, essentially, each game action and transaction is stored on the Ethereum blockchain.

## What’s TomoChain?
TomoChain is an innovative solution to the scalability problem with the Ethereum blockchain, and other blockchain platforms. 
TomoChain POSV masternode architecture offers near-zero transaction fee and instant transaction confirmation. 
Security, stability and chain finality are guaranteed via novel techniques such as double validation and uniform randomization.

TomoChain supports all EVM-compatible smart-contracts, protocols, and atomic cross-chain token transfers. 
Scaling techniques such as sharding, EVM parallelisation, private-chain generation, hardware integration will be continuously researched and integrated into TomoChain which will become an ideal scalable smart-contract public blockchain for decentralized apps, token issuance and token integration for small and big businesses.

> Every dApp running on Ethereum can be easily ported to TomoChain!

## Why should developers build dApps on TomoChain?

TomoChain is a blockchain infrastructure for practical decentralized applications.

Remember CryptoKitties in 2017? A single DApp brought the whole Ethereum blockchain to their knees. 
The network was congested, with endless waiting times for transaction confirmation and high transaction fees. 
Porting to TomoChain would seem a good idea for the cute kitties.
TomoChain mainnet can process 2'000 TPS, wich is 100x faster than the Ethereum blockchain, and for a fraction of the cost. 
If this is not good enough, the Vietnam-based company is working on its Sharding solution aiming to deliver 20'000–30'000 TPS by Q2 2019.


## Introduction

In this tutorial, we will see “How TomoRPS migrate from Ethereum to TomoChain in some hours”.
After reading the documents about TomoChain. 
We found that moving from Ethereum to TomoChain is easy and fast.
We will have 3 steps here:

1. Remove some configs of Ethereum network and replace by TomoChain network in Truffle project.
2. Compile & deploy smart contract to TomoChain networks.
3. Update old client and testing our game :)

Here is [Video](https://vimeo.com/348170191)  showing that TomoRPS was slow and had bad user experience because of low TPS of Ethereum.

### Remove some configs of Ethereum network and replace by TomoChain network in Truffle project

Now take a look our current truffle-config.js. 
We have 2 configs for deploying our smart contract to Ropsten Testnet and Ethereum Mainnet.

```javascript
var HDWalletProvider = require("truffle-hdwallet-provider");

var mnemonic = "YOUR_MNEMONIC";

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // to customize your Truffle configuration!
  networks: {
    solc: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    },
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*" // Match any network id
    },
    ropsten: {
      // must be a thunk, otherwise truffle commands may hang in CI
      provider: () =>
        new HDWalletProvider(
          mnemonic,
          "https://ropsten.infura.io/v3/9b5040ea0b704bf18af87f7edb53a644"
        ),
      network_id: "3",
      gas: 5000000
    },
    mainnet: {
      // must be a thunk, otherwise truffle commands may hang in CI
      provider: () =>
        new HDWalletProvider(
          mnemonic,
          "https://mainnet.infura.io/v3/9be4a7a6a57a47eea40d6a37af2b2712"
        ),
      network_id: "1",
      gas: 5000000,
      gasPrice: 10000000000
    }
  }
};
```

Now we will change them to connect TomoChain networks. 
Check TomoChain Networks document, we can find all configs of TomoChain networks easily.

Finally, we have new truffle-config.js after update

```javascript
"use strict";
var HDWalletProvider = require("truffle-hdwallet-provider");
var mnemonic = "YOUR_MNEMONIC";
  
module.exports = {
  networks: {
    development: {
      provider: () => new HDWalletProvider(mnemonic, "http://127.0.0.1:8545"),
      host: "127.0.0.1",
      port: "8545",
      network_id: "*" // Match any network id
    },
    tomotestnet: {
      provider: () =>
        new HDWalletProvider(
          mnemonic,
          "https://testnet.tomochain.com",
          0,
          1,
          true,
          "m/44'/889'/0'/0/"
        ),
      network_id: "89",
      gas: 5000000,
      gasPrice: 10000000000000
    },
    tomomainnet: {
      provider: () =>
        new HDWalletProvider(
          mnemonic,
          "https://rpc.tomochain.com",
          0,
          1,
          true,
          "m/44'/889'/0'/0/"
        ),
      network_id: "88",
      gas: 5000000,
      gasPrice: 10000000000000
    }
  },
  compilers: {
    solc: {
      settings: {
        evmVersion: "byzantium"
      }
    }
  }
};
```

### Compile & deploy smart contract to TomoChain networks

Now, it’s a good time to compile our smart contract with TomoChain configs.
* Run command truffle compile
* Migrate the contract to TomoChain Testnet network:

```truffle migrate --network tomotestnet```

After few seconds, our smart contract will be migrated successfully to TomoChain Testnet.


### Update client to interact with TomoChain smart contract

This is the easiest step. 
We only need change old smart contract address to new address on TomoChain and update our client (text, icon, logon…) to match with TomoChain.

```ADDRESS_CONTRACT: “0xb7cEb47FbD0f6f98E16E681eb3933B7801a1ce43”```

![updatelogo](/assets/updatetomologo.png)

### Testing
Let’s get some TOMO from faucet page. 
Open MetaMask and choose TomoChain Testnet. 
And enjoy our game working on TomoChain.

Here is the [video](https://vimeo.com/348143592) showing how fast TomoRPS is on TomoChain. 

## Conclusion
It will not be too difficult and won't take much time to migrate your dApps from Ethereum to TomoChain. 
Along with that dApps running on TomoChain has many advantages in speed and cost. 
So don’t hesitate bring your dApps to TomoChain where you can make your dApps great again… 😎


