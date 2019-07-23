# How to migrate DApps from Ethereum to TomoChain?

This tutorial shows how easy it is to migrate a DApp running on Ethereum to TomoChain 
in order to take advantages of TomoChain over Ethereum.

## What’s a DApp?

Ethereum DApps are built on smart contracts deployed onto the Ethereum blockchain where Ethereum serves as the back-end for the application.
One of the most popular DApps — Cryptokitties, is collectibles-style game built on Ethereum. 
When we build a game with Ethereum, essentially, each game action and transaction might be stored on the Ethereum blockchain.

## What’s TomoChain?
TomoChain is an innovative solution to the scalability problem with the Ethereum blockchain, and other blockchain platforms. 
TomoChain supports all EVM-compatible smart-contracts, which basically means that every DApp run on Ethereum
can be easily ported to TomoChain. 

> Every DApp running on Ethereum can be easily ported to TomoChain!

## Why should developers build DApps on TomoChain?

TomoChain is a blockchain built for practical decentralized applications.

Remember CryptoKitties in 2017? A single DApp brought the whole Ethereum blockchain to their knees. 
The network was congested, with endless waiting times for transaction confirmation and high transaction fees. 
Porting to TomoChain would seem a good idea for the cute kitties.
TomoChain mainnet can process 2'000 TPS, which is 100x faster than the Ethereum blockchain, and for a fraction (1/1000) of the cost of DApps on Ethereum. 
Furthermore, the whole TomoChain ecosystem is also quickly evolving, which makes it become an ideal platform for DApp development. 

For more information about TomoChain, please refer to our [website](tomochain.com).

## Introduction

In this tutorial, we will see how easy it is to migrate the [TomoRPS](https://tomorps.online/) (source code can be found in [here](https://github.com/frogdevvn/tomorps-smartcontract) and [here](https://github.com/frogdevvn/tomorps-backend)) game from Ethereum to TomoChain in 1 hour.

The migration consists of 3 steps:

1. Remove some configs of Ethereum network and replace by TomoChain network in Truffle project.
2. Compile & deploy smart contract to TomoChain networks.
3. Update old client and testing the game :)

Here is [Video](https://vimeo.com/348170191) showing that TomoRPS was slow and had bad user experience because of low performance of Ethereum.

### Remove some configs of Ethereum network and replace by TomoChain network in Truffle project

Take a look our current truffle-config.js. 

We have 2 configs for deploying the smart contract to Ropsten Testnet and Ethereum Mainnet.

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

To deploy the same contract onto TomoChain, let's change the configuration to connect to the TomoChain network. 
Check [TomoChain Network](https://docs.tomochain.com/general/networks/) document, we can find all configs of TomoChain networks easily.
The configuration change basically tells Truffle to connects to TomoChain and deploy the contract on it instead of Ethereum.

Finally, we have the updated truffle-config.js.

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

Now, it’s a good time to compile the smart contract with TomoChain networks.

* Run command `truffle compile`
* Migrate the contract to TomoChain Testnet network:

```truffle migrate --network tomotestnet```

After a few seconds, the smart contract will be migrated successfully to TomoChain Testnet.


### Update client to interact with TomoChain smart contract

This is the easiest step. 
We only need change old smart contract address to new address on TomoChain and update our client (text, icon, logon…) to match with TomoChain.

```ADDRESS_CONTRACT: “0xb7cEb47FbD0f6f98E16E681eb3933B7801a1ce43”```

You can go to [TomoScan Testnet](https://scan.testnet.tomochain.com) to verify the contract deployment.

![updatelogo](/assets/updatetomologo.png)

### Testing

Let’s get some faucet TOMO from the [faucet page](https://faucet.testnet.tomochain.com). 

Connect MetaMask to TomoChain Testnet by following this [guide](/get-started/wallet).

You can even play the game with [TomoWallet](https://docs.tomochain.com/products/tomowallet/features/) through our built-in DApp Browser, which provides the best user experience for gamers. 
 
And enjoy the game running on TomoChain and taste how fast and cheap transactions on TomoChain are.

Here is the [video](https://vimeo.com/348143592) showing how fast TomoRPS is on TomoChain. 

## Conclusion
It will not be too difficult and won't take much time to migrate your DApps from Ethereum to TomoChain. 
Along with that DApps running on TomoChain has many advantages in speed and cost. 
So don’t hesitate bring your DApps to TomoChain where you can make your DApps great again… 😎


