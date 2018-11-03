Once your full node is up and running, you need to apply to make it eligible as a masternode.

## Implications of applying
Masternodes will receive a significant amount of block rewards, which likely exceeds the cost for running the infrastructure.
However, masternode candidates need to invest in TomoChain by depositing at least 50'000 TOMO, and stake them for a long term.
Furthermore, after depositing 50K TOMO to become a Candidate, if the account cannot become a Masternode (has less votes than Top 150 most voted Candidates), he/she will receive no rewards.
Therefore, Candidates have an incentive to do as much as they can such as signaling their capability to support TomoChain to get into top 150 most voted Candidates.

## Requirements
For a token holder to become a masternode, the following requirements must be satisfied:

* The token holder has a node up and running -- recommended to do this with `tmn`.

* The token holder must hold a minimum required amount of tokens (50 000 TOMO).
These 50 000 TOMO are deposited to the Voting Smart Contract.

* The token holder must be one of the 150 most voted masternode candidates in the system.
The voting by token holders is credited through a Voting DApp that allows token holders to send TOMO through the smart contract mechanism.

## Applying to become a masternode
You can apply by going to the TomoMaster page.
Login with the wallet that contains your received 50'000 TOMO.

On the top right corner, click on "Become a Candidate".

Enter the amount of TOMO you want to deposit (minimum 50'000).

Enter your coinbase address. This is the public key of the account that your masternode is using.
If your are running your node with `tmn`, you can simply run `tmn inspect` to get it.

!!! note "Important note:"
	We advise for security measures to use a fresh new account for your masternode or 'coinbase address'.
	This is not the account that will receive the rewards.
	The rewards are sent to the account that will make the 50k TOMO initial deposit.

Confirm with apply and proceed to make the payment.

Your full node will now be listed on TomoMaster.
People can view its details and vote for it.

A Candidate becomes a Masternode when he/she belongs to top 150 most voted Candidates in each epoch (900 blocks or ~30 minutes). 

If your node is in the top 150 most voted nodes in each epoch, it will be promoted as a masternode and will start producing blocks at the next epoch.

## Resigning your masternode
In case you want to stop your node, you need to resign it from the governance first in order to retrieve your locked funds.
Access TomoMaster, go to your candidate detail page, and click the `Resign` button.
Your funds will be available to withdraw 30 days after the resignation (1,296,000 blocks).

After resigning successfully, you can stop your node. If you ran it with `tmn`, simply run:
```
tmn remove
```

At this point, your masternode is completly terminated.
