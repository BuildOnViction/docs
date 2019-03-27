Once your full node is up and running, you need to apply 
it to make it eligible as a masternode.
[This page](/get-started/run-node/) shows a tutorial for beginners to run a full node.

## Getting sufficient TOMO
As 50'000 TOMO are required to apply: 

* If you plan to run your node on testnet, you need to 
fill out the following [form](https://docs.google.com/forms/d/183UxYRET9I183L7lFHCredjaTd9oj4kmf4UdH7eLNNs):
to get 50k TOMO for testnet.

<iframe src="https://docs.google.com/forms/d/e/1FAIpQLSf0BiG8Rs5v4ItkwykgWUXsavLRZNA9W_EHTDis7klk5mNJnw/viewform?embedded=true" width="640" height="900" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>

Our team will then review your request and send you the required funds.

*Note: Those testnet TOMO are only usable in testnet, they have absolutely no trading value*

* If you plan to run your node on mainnet, you need to acquire at least 50k TOMO on 
exchanges that list TOMO. 
Please refer to [this page](https://tomochain.com/about-us/) for which exchanges listing TOMO.

## Applying to become a masternode
You can now apply by going to the TomoMaster page for 
[testnet](https://master.testnet.tomochain.com) or [mainnet](https://master.tomochain.com).
Login with the wallet that contains your newly received 50'000 TOMO.

On the top right corner, click on "Become a Candidate".

Enter the amount of TOMO you want to deposit (minimum 50'000).

Enter your coinbase address. This is the public key of the account that your masternode is using.
If your are running your node with `tmn`, you can simply run `tmn inspect` to get it.

Confirm with apply and proceed to make the payement.

Your full node will now be listed on TomoMaster.
People can view its details and vote for it.

If your node is in the top 150 most voted nodes, it will be promoted 
as a masternode and will start producing blocks at the next epoch.

## Resigning your masternode
In case you want to stop your node, you need to resign it from TomoMaster first 
in order to retrieve your locked funds.
Access TomoMaster for [testnet](https://master.testnet.tomochain.com) or 
[mainnet](https://master.tomochain.com), go to your candidate detail page, 
and click the `Resign` button.
Your funds will be available to withdraw 1440 epochs (around 30 days) after the resignation.

After resigning successfully, you can stop your node. If you ran it with `tmn`, simply run:
```
tmn remove
```

At this point, your masternode is completly terminated.
