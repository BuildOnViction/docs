# Check Node (and Masternode) Status and Synchronization

Once you have started a TomoChain full-node to begin synchronizing (either via tmn or docker or native), we want to see its status and watch its progress.
There are a number of tools to do this, which are introduced below.

---

The most important commands are listed here and explained further below:
```shell
tmn status    # Shows whether tomo is running or not
tmn inspect   # Shows more info on running tomo instance
tmn --help    # See other commands for tmn
tmn update    # Update the tmn client (not a sync command)

docker exec $(docker ps -q -f "name=tomochain") tomo attach /tomochain/data/tomo.ipc --exec "eth.blockNumber"
docker exec $(docker ps -q -f "name=tomochain") tomo attach /tomochain/data/tomo.ipc --exec "net.peerCount"

https://stats.tomochain.com/
```

---

First, from the command line of the node, run the below commands.
The first two commands show if the `tomo` binary is running, what its name is, what its docker ID is, and its Coinbase address.
The Help command shows other available `tmn` commands.
These do not reflect that the node is synchronized with the network, nor that it is a masternode, nor that it is getting rewards.

```shell
tmn status
tmn inspect
tmn --help
```

When you first start your node, it begins to synchronize blocks from 0, downloading them from other nodes.
To see which block your masternode is on, you can run the following blockNumber command.
The subsequent peerCount command tells you how many other nodes you are connected with.

```shell
docker exec $(docker ps -q -f "name=tomochain") tomo attach /tomochain/data/tomo.ipc --exec "eth.blockNumber"
docker exec $(docker ps -q -f "name=tomochain") tomo attach /tomochain/data/tomo.ipc --exec "net.peerCount"
```

With a few peers and blocks, you should now be able to see your newly-synchronizing node listed on TomoChain's official "Stats" webpage.
It could take 10-30 mins, so be patient.

* https://stats.tomochain.com/

Being on the "stats" page does not mean your node is a masternode; just that it is a node (more precisely, a fullnode).
There can be non-masternode nodes, even once synchronized.
Why would any one do that?
A dApp developer may want to keep a synchronized chain so that they can easily interact with the blockchain - yet they have no intent to be a masternode.

You should also become familiar with how to update tmn.
The below command updates your `tomo` binary to the latest version.
This stops and restarts the process, so no need to do it now.
If you want to be up-to-date, watch the TomoChain telegram chat for announcement and updates.

```shell
tmn update
```
