
Once your full node is up and running, you need to apply it to make him eligible as a masternode.

## Getting sufficient TOMO
As well as 50,000 TOMO, the following [form] also needs to be completed (https://docs.google.com/forms/d/183UxYRET9I183L7lFHCredjaTd9oj4kmf4UdH7eLNNs):

<iframe src="https://docs.google.com/forms/d/e/1FAIpQLSf0BiG8Rs5v4ItkwykgWUXsavLRZNA9W_EHTDis7klk5mNJnw/viewform?embedded=true" width="640" height="900" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>

Our team will then review your request and send you the required funds. 

*Note: Those TOMO are only usable in testnet, they have absolutely no trading value*

## Applying to become a masternode
You can now apply by going on the [TomoMaster](https://master.testnet.tomochain.com) page.
Login with the wallet that contains your newly received 50'000 TOMO.

On the top right corner, click on "Become a Candidate".

Enter the amount of TOMO you want to deposit (minimum 50'000).

Enter your coinbase address. This is the public key of the account that your masternode is using. 
If your are running your node with `tmn`, you can simply run `tmn inspect` to get it.

Confirm with apply and proceed to make the payement.

Your full node will now be listed on TomoMaster.
People can view its details and vote for it.

If your node is in the top 150 most voted nodes, it will be promoted as a masternode and will start producing blocks at the next epoch.

## Resigning your masternode
In case you want to stop your node, you need to resign it from the governance first in order to retrieve your locked funds.
Access [TomoMaster](https://master.testnet.tomochain.com), go to your candidate detail page, and click the `Resign` button.
Your funds will be available to withdraw 30 days after the resignation.

After resigning successfully, you can stop your node. If you ran it with `tmn`, simply run:
```
tmn remove
```

At this point, your masternode is completly terminated.
