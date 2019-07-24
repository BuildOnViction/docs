# Building Your First Game dApp On TomoChain (Part 1)

Challenge yourself  by building a simple lucky dApp game with Truffle Framework, Cocos Creator and deploy to TomoChain. 💪

## What are dApps?

* Understanding Blockchain: Before we can even fathom what dApps do, we need to be familiar with its underlying technology — the blockchain. 
Put simply, a blockchain is a ledger of records organized in ‘blocks’ that are linked together by cryptographic validation. 
It is a digital storage of consensus truth. 
The key is to understand that this ledger is neither stored in a centralized location nor managed by any single entity, hence its distributed-ness. 
The block validation system results in new transactions being added irreversibly and old transactions preserved forever for all to see, hence its transparency and resilience. 
Open-source software that leverage blockchain technology are called dApps.

* Understanding Smart Contract: Smart contracts help you exchange money, property, shares, or anything of value in a transparent, conflict-free way while avoiding the services of a middleman. 
The best way to describe smart contracts is to compare the technology to a vending machine. 
Ordinarily, you would go to a lawyer or a notary, pay them, and wait while you get the document. 
With smart contracts, you simply drop a bitcoin into the vending machine (i.e. ledger), and your escrow, driver’s license, or whatever drops into your account. 
More so, smart contracts not only define the rules and penalties around an agreement in the same way that a traditional contract does, but also automatically enforce those obligations. 
If you are looking for a more detailed walkthrough of smart contracts please check out our blockchain courses on smart contracts.

> dApp is an abbreviation for Decentralized application. dApps are a new paradigm for building apps where a back end centralized server is replaced by a decentralized peer to peer network.

> One of the most popular dApps, cryptokitties, is a collectibles-style game built on Ethereum. When we build a game with Ethereum each game action and transaction is stored on the Ethereum blockchain.


## What is TomoChain?

TomoChain is an innovative solution to the scalability problem with the Ethereum blockchain, and other blockchain platforms. 
TomoChain supports all EVM-compatible smart-contracts, which basically means that every DApp run on Ethereum
can be easily ported to TomoChain. 

For more information about TomoChain, please refer to our [website](tomochain.com).

## What is Cocos Creator?

Cocos Creator is a complete package of game development tools and workflow, including a game engine (based on Cocos2d-x), resource management, scene editing, game preview, and debug and publish from one project to multiple platforms.

For the first time we introduced entity-component structure and data-driven workflow to the Cocos2d-x family. With JavaScript, you can script your component in no time. The editor and engine extension is also made with JavaScript so you can make games and refine your tools in a single programming language.

Cocos Creator provides an innovative, and easy to use toolset such as the UI system and Animation editor. The toolset will be expanding continuously and quickly, thanks to the open editor extension system.

Homepage: https://cocos2d-x.org/creator

Docs: https://docs.cocos2d-x.org/creator/manual/en/

## Overview “Tomo Lucky Box” game dApp

For this tutorial, we will make a simple game dApp called “Tomo Lucky Box” using Cocos Creator.

Gameplay: We have 3 boxes to choose. We need to pay 1 TOMO each time we open one box, if you choose the lucky box you will get a prize.

We recommend you have a basic understanding of:

* JavaScript (Good [link](https://www.w3schools.com/js/?source=post_page---------------------------) to read)
* Solidity & smart contract (Good [link](https://cryptozombies.io/?source=post_page---------------------------) to read)
* Truffle framework (Good [link](https://www.trufflesuite.com/docs/truffle/overview?source=post_page---------------------------) to read)
* Cocos Creator (Good [link](https://docs.cocos2d-x.org/creator/manual/en/?source=post_page---------------------------) to read)

[![](http://img.youtube.com/vi/bBVyxhmS9lg/0.jpg)](http://www.youtube.com/watch?v=bBVyxhmS9lg "TomoLuckyBox game running on TomoChain")


## Create a TOMO Wallet

You will need a wallet address and some tokens. We will show you how to do it on both TomoChain Testnet and Mainnet.

### Create a TOMO wallet and save your Mnemonic
You can create a new TOMO wallet using TomoWallet mobile app for Android or iOS. Under Settings go to Advanced Settings, here you can Choose network and select TomoChain TestNet or TomoChain MainNet.

Go to Settings menu, select Backup wallet and then Continue. Here you can see your wallet’s private key and the 12-word recovery phrase. Write down the 12-word recovery phrase.

![Wallet](/assets/game1_wallet.png)

You can also [create a new TomoChain wallet with MetaMask, MyEtherWallet or TrustWallet](https://docs.tomochain.com/get-started/wallet/?source=post_page---------------------------). 
For instance, for mainnet you can go to [MyEtherWallet](https://www.myetherwallet.com/?source=post_page---------------------------) and select TOMO (tomochain.com) on the top right corner. 
Enter a password and then Create a new wallet. Write down your recovery phrase.

For this tutorial, the wallet address (testnet) is:
```0xc9b694877acd4e2e100e095788a591249c38b9c5```

The recovery phrase (12-word mnemonic) is:

```myth ahead spin horn minute tag spirit please gospel infant clog camera```

Write them down. 
This will be needed later. Notice that your wallet address (public key) and your recovery phrase will be different than mine.

> Important! Always keep your private key and recovery phrase secret!

### Get some TOMO funds

Tokens are required for different matters, like smart contract deployment or to use in DApps.

**Testnet**: Receive 15 free testnet TOMO tokens using TomoChain’s Faucet.

**Mainnet**: You need real TOMO from exchanges.

Go to faucet and collect `30 TOMO`. 
Now your wallet has enough balance to do everything in this tutorial so… let’s go ahead!

### The Block Explorer

To check the balance of a wallet address, you can search the address on TomoScan.

**Testnet**: https://scan.testnet.tomochain.com/

**Mainnet**: https://scan.tomochain.com/

## Write TomoLuckyBox Smart Contract

### Create Truffle project

Open your Terminal. Run commands:

```
mkdir tomoluckybox-smartcontract
cd tomoluckybox-smartcontract
truffle init
```

#### Config TomoChain networks for Truffle project

Open file truffle-config.js, and replace with below code to config TomoChain Mainnet and TomoChain Testnet

```javascript
"use strict";
var HDWalletProvider = require("truffle-hdwallet-provider");
var mnemonic = "<PUT YOUR WALLET 12-WORD RECOVERY PHRASE HERE>";

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
      gas: 2000000,
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

### TomoLuckyBox.sol

Create a new file named TomoLuckyBox.sol in the contracts/ directory.

Our TomoLuckyBox.sol smart contract will control the core logic for our game.

Check full source code of smart contract on [GitHub](https://github.com/frogdevvn/tomoluckybox-smartcontract/blob/master/contracts/TomoLuckyBox.sol?source=post_page---------------------------).

Let’s have a look at some snippets code:

**Constant**: We define some constant variables to help our smart contract code easier to read and understand. And we have a nonce, which will be used to randomize our results efficiently


```solidity
uint constant LUCKY_BOX_1 = 1000;
uint constant LUCKY_BOX_2 = 2000;
uint constant LUCKY_BOX_3 = 3000;
uint constant RESULT_WIN = 1;
uint constant RESULT_LOSE = 0;
uint nonce = 0;
```

**Events**: We have only 1 event LogRandomLuckyBoxSuccessed, this event will emit when player request to open their selected box and smart contract will random result and return it to player. Events help in conveying state change on the front-end.

```solidity
event LogRandomLuckyBoxSuccessed(
     address indexed _addressSender,
     uint _valueReturn,
     uint _idLuckyBoxReturn,
     uint _amountPrize);
```

**Functions**:

* random: This is core function to help us random a number between 1-> 9

> NOTE: Current implement of our random is not secure. For production mode, you can use Oraclize or Commit-Reveal for good secure.


```solidity
//WARNING: THIS RANDOM FUNCTION IS NOT SECURITY, DON'T USE IT IN PRODUCTION MODE
  //YOU CAN IMPLEMENT SECURE RANDOM  USE RANDAO OR COMMIT-REVEAL SCHEMA
  function random() internal returns (uint) {
    uint randomNumber = uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, nonce))) % 9;
    randomNumber = randomNumber + 1;
    nonce++;
    return randomNumber;
  }
```

* randomLuckyBox: Receive which box of player selected, then we will perform to random the lucky box with following steps:

    - Random number between 1->9.
    - Depend on random number above we will check to get result of player is win or lose.
    - If player win, we calculate prize and send payment to player address. Then finally, LogRandomLuckyBoxSuccessed to front-end.
    

```solidity
function randomLuckyBox(uint idBoxSender)
    external
    payable
  {
    uint randomNumber = random();
    uint idLuckyBox = 0;
    if(randomNumber >= 1 && randomNumber <= 3)
      idLuckyBox = LUCKY_BOX_1;
    else
      if(randomNumber >= 4 && randomNumber <= 6)
        idLuckyBox = LUCKY_BOX_2;
      else
        idLuckyBox = LUCKY_BOX_3;
    if(idLuckyBox == idBoxSender) {
      uint amountPrize = msg.value * 3;
      sendPayment(msg.sender, amountPrize);
      emit LogRandomLuckyBoxSuccessed(msg.sender, RESULT_WIN, idLuckyBox, amountPrize);
    }
    else {
      emit LogRandomLuckyBoxSuccessed(msg.sender, RESULT_LOSE, idLuckyBox, 0);
    }
  }
```

**sendPayment**: Help smart contract can send payment to player address.

```solidity
function sendPayment(address payable _receiverAdress, uint _amount) private {
      _receiverAdress.transfer(_amount);
  }
```

### Deploying our smart contract to TomoChain

Run the commands below to compile and deploy our contract to TomoChain Testnet.

```
truffle compile
truffle migrate --network tomotestnet
```

The migrations will start…

```
Starting migrations...
======================
> Network name:    'tomotestnet'
> Network id:      89
> Block gas limit: 84000000
1_initial_migration.js
======================
Deploying 'Migrations'
   ----------------------
   > transaction hash:    0x77d9cdf0fb810fd6cec8a5616a3519e7fa5d42ad07506802f0b6bc10fa9e8619
   > Blocks: 2            Seconds: 4
   > contract address:    0xA3919059C38b1783Ac41C336AAc6438ac5fd639d
   > account:             0xc9b694877AcD4e2E100e095788A591249c38b9c5
   > balance:             27.15156
   > gas used:            284844
   > gas price:           10000 gwei
   > value sent:          0 ETH
   > total cost:          2.84844 ETH
   > Saving migration to chain.
   > Saving artifacts
   -------------------------------------
   > Total cost:             2.84844 ETH
2_deploy_contracts.js
=====================
Deploying 'TomoLuckyBox'
  --------------------
   > transaction hash:    0x1c48f603520147f8eebc984fadc944aa300ceab125cf40f77b1bb748460db272
   > Blocks: 2            Seconds: 4
   > contract address:    0xB4Bb4FebdA9ec02427767FFC86FfbC6C05Da2A73
   > account:             0xc9b694877AcD4e2E100e095788A591249c38b9c5
   > balance:             24.19238
   > gas used:            253884
   > gas price:           10000 gwei
   > value sent:          0 ETH
   > total cost:          2.53884 ETH
   > Saving migration to chain.
   > Saving artifacts
   -------------------------------------
   > Total cost:             2.53884 ETH
Summary
=======
> Total deployments:   2
> Final cost:          5.38728 ETH
```

## Conclusion

We finish part 1 finally. In next part we will create Cocos Creator project for front-end and make it working with our smart contract through web3.js.


## More about TomoChain
TomoChain is an innovative solution to blockchain scalability and functionality. Its decentralized 150 masternode Proof of Stake (POSv) architecture incentivises Tomo token-holders to play an active part in staking, while offering near-zero transaction fees with instant confirmation. TomoChain supports all EVM-compatible smart-contracts, protocols, and atomic cross-chain token transfers. This interoperability creates a product ecosystem that allows solidity developers, entrepreneurs, enterprises, and institutions to build high-performance, feature-rich blockchain solutions on an enhanced platform. Scaling techniques such as sharding, EVM parallelization, private-chain generation, hardware integration will be continuously researched and integrated into TomoChain making it the ideal blockchain platform.

TomoChain has additionally developed three game-changing products; TomoZ, TomoIssuer, and TomoX.  TomoZ, “zero-friction protocol”, uses the innovative TRC21 token standard which allows for transaction fees to be paid in any token.  This means a user does not need to have additional Tomo to pay gas fees, fixing a massive barrier to mass-adoption. TomoIssuer allows individuals, developers, and institutions to be able to create and issue their own unique TRC21 token in a matter of minutes. Next, operating on layer one, TomoChains decentralized exchange, TomoX, empowers a diverse system of relayers, MM providers, and independent projects to work together in a decentralized manner.  TomoX combines the on-chain security and order book aggregation of a DEX, with a high-quality UX and trading speeds formerly offered only by centralized exchanges.  Deployment is simple and relayers can launch their own DEX in 10 minutes.
