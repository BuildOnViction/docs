## Prerequisites

- Have a wallet connected to the Testnet (See [this tutorial](/get-started/wallet))

## Introduction

With a connected wallet, it's not time to try voting for some masternodes.

## Get some TOMO

!!! info
    Testnet TOMO are only used for experimenting with the testnet.
    They have no value in the main blockchain and not market value.

### Using TomoWallet

TomoWallet provides a function named `Earn TOMO to test`. It allows you to get 15 TOMO on the Testnet.
Just click on it and you will see your balance go up.

!!! note
    You can use this function only once. You then have to use the faucet for any extra Testnet TOMO needed.

### Using any wallets

We also have a service called "Faucet" which allows you to get 15 TOMO at a time.

Access the faucet site at: [faucet.testnet.tomochain.com](https://faucet.testnet.tomochain.com)

Enter your wallet address in the field and tick the `I'm not a robot` box.

Click `REQUEST 15 TOMO` and Wait for some seconds for the transaction to be confirmed.

You will receive a success confirmation message and the amount of TOMO in your wallet should be updated. You can check your TOMO balance by either looking at your wallet or using [TomoScan](https://scan.testnet.tomochain.com).

## How To Vote

Now you have some TOMO. You can access our governance dApp, [TomoMaster](https://master.testnet.tomochain.com/), to start voting for masternodes.


TomoMaster natively supports Metamask. You can also access your account page (the vertical three dots on the top right) to fill in your wallet Private Key or MNEMONIC (see image below).

If you use Metamask, you need to connect Mettamask to our testnet (please see the "Create a wallet" section) and choose Metamask in the drop-down settings list.


![Setting](/assets/settingpage.jpg)

Once configured, you can vote for masternodes by clicking on the `Vote` button.


![Vote](/assets/vote.jpg)

At least 100 TOMO is required per vote. After clicking submit, your TOMO will be sent to the voting smart contract and locked there.

## Reward
Every epoch (~30 minutes), you will automatically receive rewards for each masternode you voted for.

## How to Unvote

If you do not want to support a masternode you voted for, you can unvote it by clicking the `Unvote` button on the masternode's page and enter the amount of TOMO you want to unvote.

After unvoting, your TOMO is still locked in the smart contract for 48 hours before you are able to withdraw.

## How to Withdraw

For withdrawals after unvoting, you need to wait until your TOMO is unlocked from the smart contract. Then you can click the `withdraw` button in your account page (the vertical three dots on the top right) and choose which withdrawal you want to receive back your TOMO.

Note that you might see multiple withdrawals on your account page if you made multiple unvotes previously.

If you withdraw before the unlock period expires, an error will be raised.
