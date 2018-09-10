
Once your full node is up and running, you need to apply it to make him eligible as a masternode.

## Get TOMO
As 50'000 TOMO are required for applying, the first thing to do is to fill out he following [form](https://docs.google.com/forms/d/183UxYRET9I183L7lFHCredjaTd9oj4kmf4UdH7eLNNs):

<iframe src="https://docs.google.com/forms/d/e/1FAIpQLSf0BiG8Rs5v4ItkwykgWUXsavLRZNA9W_EHTDis7klk5mNJnw/viewform?embedded=true" width="640" height="963" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>

Our team will then review your demand and send you the required funds.

*Note: That is TOMO on testnet, no value for trading*

## Applying as masternode
You can now apply by going on the [TomoMaster](https://master.testnet.tomochain.com) page, login your wallet (that contains 50'000 TOMO).

On the top right corner, click on "Become a Candidate".

Enter the amount of TOMO you want to deposit (minimum 50'000).

Enter your coinbase address. This is the public key of the account that your masternode is using. If your are running your node with `tmn`, you can simply run `tmn inspect` to get it.

Confirm with apply and proceed to make the payement.

Your full node will now be listed on TomoMaster. People can view its details and vote for it.

If your node is in the top 150 most voted nodes, it will be promoted as a masternode and will start producing blocks at the next epoch.

## Resigning as masternode
In case, you want to stop your node. You need to access [TomoMaster](https://master.testnet.tomochain.com), go to your candidate detail page, and click `Resign` button.

After resigning successfully, you can access the node and run command:
```
tmn remove --confirm
```
Then your node will be stopped.
