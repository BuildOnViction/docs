Once your full node is up and running, you need to apply it to make him eligible as a masternode.


## Applying to become a masternode
You can now apply by going on the [CaelumMaster](https://master.testnet.caelumfoundation.com) page.
Login with the wallet that contains your newly received 50'000 CLMP.

On the top right corner, click on "Become a Candidate".

Enter the amount of CLMP you want to deposit (minimum 50'000).

Enter your coinbase address. This is the public key of the account that your masternode is using.
If your are running your node with `Apollo`, you can simply run `bash apollo.sh inspect` to get it.

Confirm with apply and proceed to make the payement.

Your full node will now be listed on TomoMaster.
People can view its details and vote for it.

If your node is in the top 150 most voted nodes, it will be promoted as a masternode and will start producing blocks at the next epoch.

## Resigning your masternode
In case you want to stop your node, you need to resign it from the governance first in order to retrieve your locked funds.
Access [CaelumMaster](https://master.testnet.caelumfoundation.com), go to your candidate detail page, and click the `Resign` button.
Your funds will be available to withdraw 30 days after the resignation.

After resigning successfully, you can stop your node. If you ran it with `Apollo`, simply run:
```
bash apollo.sh clean
```

At this point, your masternode is completly terminated.
