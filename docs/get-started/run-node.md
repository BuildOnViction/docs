With the recent release of Go-Caelum Testnet 2.0 with our PoSV consensus, you might be interested in creating a Caelum full node and applying it to be a masternode.

To run a full node and meet the requirements to apply on our governance DApp, you have to run the follwing services:

- The [go-caelum client](https://github.com/caelumdev/go-caelum), our Caelum implementation written in _Go_.

## General hardware notice

Our team extensively tested performances and came up with those minimal requirements for any Caelum masternode host.

**Testnet**

- Must be facing internet directly (no NAT, public IP)
- Must have at least 2 cores
- Must have at least 8GB of RAM
- Must use an IaaS ("cloud") provider of your choice (AWS, Digital Ocean, Google Cloud, etc.).
- Storage must be SSD

**Mainnet**

- Must be facing internet directly (no NAT, public IP)
- Must have at least 16 cores
- Must have at least 32GB of RAM
- Must use an IaaS ("cloud") provider of your choice (AWS, Digital Ocean, Google Cloud, etc.)
- Storage must be SSD

We recommand prioritizing CPU. For example with Digital Ocean, pick a CPU optimized droplet. On AWS EC2, an C5 type instance would be a perfect match.

The full node will serve on port `30303` udp and tcp for p2p communication with other nodes, `8545` tcp for RPC api and `8546` tcp for websocket api.
You may need to edit your firewall configuration accordingly.

If you have other production grade environment than cloud provider at your displosal, please tell us more about on our [Telegram](https://t.me/caelumofficial).

## Apollo

We made a simple command line interface called [Apollo](https://github.com/caelumproject/Apollo) to easily and quickly start a Caelum masternode.
It takes care of starting the necessary docker containers with the proper settings for you.
It will really suit you if you don't already have a big infrastructure running.
Spin up a machine in your favorite cloud and get your masternode running in a few minutes!


### Installation

Simply install it from console.

```
git clone https://github.com/caelumproject/Apollo
```

If you don't have Golang and/or go-caelum installed yet, run our installation script

```
bash install-server.sh
```

### Update

Update it from console.

```
bash apollo.sh update
```


### Configuration

From within the Apollo directory, run `bash apollo.sh start`.

The start command will execute the configuration helper. Please follow the steps displayed on the console to setup Apollo once.

### Usage

Run the apollo scipt by executing `bash apollo.sh` along with one of the following parameters:

 - `start` Launches the masternode
 - `stop` Stops the caelum masternodes
 - `import` Allows a user to import a private key
 - `force-close` Force close all running caelum instances
 - `update` Update the Apollo files to their latest version
 - `log` Shows the daemon output. Ctrl+c to exit.
 - `clean` Remove the entire datadir

 **Hint!** You can run all these actions in one go by running `bash apollo.sh start`. This executes all needed steps in a single command.

 Enter any key in your console to let the masternode run in the background.

 Check if you are displayed on our stats page https://stats.testnet.caelumfoundation.com/

 Send our developers a DM to receive some testnet tokens in order to activate and setup your masternode.

 Subscribe to the Telegram channel for updates/instructions as masternode owner https://t.me/joinchat/AAAAAFankV-nfwLbBRbHMw

---

**Setting up a masternode with no initial masternode address**

`bash apollo.sh start` for the first time.

It will ask you if you want to create a new coinbase account, or import an existing one.

The password will be saved in `/Apollo/.pwd` and the address will be saved in `/Apollo/testnet.env`.

Complete the setup helper. This will then start the node and begin syncing.

**Setting up a masternode with an existing masternode address (importing)**

Run `bash apollo.sh import` and follow the steps.

**Connecting to our testnet with MetaMask**

You will need to go to https://master.testnet.caelumfoundation.com/

There you must click the `login`button. If you use metamask, you need to connect to a custom network first

```
RPC URL: https://testnet.caelumfoundation.com
Chain ID: 159
Symbol CLMPTESTNET
Nickname CLMP_TESTNET
```

### Run latest dev branch

```
cd && git clone https://github.com/caelumproject/go-caelum-dev && cd go-caelum-dev && git checkout rebrand && make caelum && sudo rm  /usr/local/bin/caelum && sudo cp build/bin/caelum /usr/local/bin
```

To return to the stable version:

```
cd && cd go-caelum && git checkout master && make caelum && sudo rm  /usr/local/bin/caelum && sudo cp build/bin/caelum /usr/local/bin
```

---

### Common issues

Note: You might need `sudo` permissions to run any commands below.

On first install: `chmod: changing permissions of FILE/DIR denied`: rerun `chmod -R 755 Apollo` with `sudo` permissions.

`permission denied` when running `.sh` files: First execute `chmod +x FILE_NAME` to grant permissions

When updating via `git pull`: `error: Your local changes to the following files would be overwritten by merge:` Stash the local changes made by the `chmod` action by executing `git stash` first.

### Upgrading go-caelum

Whenever new updates are available, please run `bash upgrade-caelum.sh`.

### Upgrade Apollo

`cd && rm -rf Apollo && git clone https://github.com/caelumproject/Apollo && chmod -R 755 Apollo/ && cd Apollo`

This will remove the repository and reinstall it completely.

### Known bugs

After creating the initial account, chances are likely that your node will start without unlocking the account first. Until this is fixed, we recommend you, after first run, to stop the node and restart it. Check the logs to confirm it's running!.
