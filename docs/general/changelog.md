# Changelog

This tab now contains all the major new features about the Tomochain software. You can follow the progress of the project here chronologically.

# Tomochain
[v0.2.0] – 09-10-2018
  - Enhanced masternode set selection on each epoch.
  - Introduction of one single TOML file to run full-node to get rid of long-typing multiple flags.
  - Stabilized block importing between nodes.
  - Integration with TMN - our CLI for masternode life-cycle management.
 
[v0.1.0] – 08-21-2018

Introduction of :
  - Consensus POSV - Proof of Stake Voting.
  - Block producer (masternode).
  - Reward engine and staking mechanism.
  - TomoScan is a block explorer. You can check useful statistics about the TomoChain performance, the token holders and other functionalities.
  - Tomomaster allows users to vote for masternodes and apply to become eligible to own a masternode.
  - Built-in smart contracts for voting and reward system.

### Tomomaster

[v0.2.0] – 09-06-2018
  - Desktop version released.
  - Optimized withdrawals page.
  - Voters can now search for a candidate.
  - Several bug fixes.

[v0.1.0] – 08-21-2018

This release provides the following features that are included in the TomoChain Public Testnet 2.0 ecosystem. Specifically, what users can do with this release is the following:

  - About the vote of users/token-holders for the masternodes: each vote requires sending at least 10 TOMO to trigger the voting smart contract.
  - Users can unvote and withdraw their votes for a masternode. The withdrawal is only valid two days after the unvote has been made.
  - From now on, rewards are directly paid for voters and masternodes at the end of each epoch.
  - Current list of masternodes and candidates has been updated.
  - You can now monitor the metrics of the masternode's performance such as CPU, RAM usage, the amount of voted tokens and the signatures of masternodes.
  - Infrastructure of the nodes has been updated so you can apply to become a candidate.

### Tomoscan

[v0.2.0] – 01-10-2018

  - Added anchors for the tabs.
  - Code of the crawler revised.
  - New users will now receive a welcome email.
  - You can now correctly add an address to the address list followed.
   - Rewards are now correctly distributed.
   - The search does not return 500 anymore if no result is found.
  -  Verified contracts now display the correct number of transactions.
   - During a login the user is now correctly redirected.
   - Fixed a bug where weird symbols were added in the name of the tokens.
  -  Solidity code is now displayed on the verified contracts page .
   - Fixed a bug where no transaction was displayed.
   - Fixed a bug in the crawler that prevented it from properly recovering account information.
   - Fixed several UX bugs.
 
 [v0.1.0] – 09-20-2018
 
 Three modules have been released:
  - Crawl data from a full node.
  - Serve Restful API.
  - Web Application.
  
### TMN

[v0.2.0] – 09-28-2018
  - Logic has been refactored completely.
  - Masternode has been updated with the latest version of the Tomochain client.
  - Your logs will now never exceed 3GB thanks to the log rotation.
  - Minor aesthetics changes.

[v0.1.0]  – 09-10-2018

You can now :
  - Start a full node.
  - Stop a full node.
  - Inspect the full node.
  - Get the full node status.
  - Remove a full node.


### TomoWallet

[v0.1.0] – 09-26-2018  

The following features were added:
  - You can now create and import a wallet.
  - You can transfer and receive TOMO for Testnet use only.
  - You can earn TOMO for Testnet use only.

### TomoMobileWallet


TomoMobileWallet is now available on Playstore and Apple store.

