We made a simple command line interface called [Apollo](https://github.com/tomochain/masternode) to easily and quickly start a Caelum masternode.
It takes care of starting the necessary steps with the proper settings for you.
It will really suit you if you don't already have a big infrastructure running.
Spin up a machine in your favorite cloud and get your masternode running in a few minutes!

Once started, you should see your node on the [stats page](https://stats.testnet.tomochain.com)!

Note: it can take up to one hour to properly sync the entire blockchain.


### Installation

Depending on your security level in your shell, the root password can be asked during the installation script to execute `sudo` commands during installation.

`git clone https://github.com/caelumproject/Apollo`

If you don't have Golang and/or go-caelum installed yet, run our installation script:
`cd Apollo`
`bash install-server.sh`.
Follow the prompts and accept/enter when asked. Once finished you might be asked to close/restart the terminal.
On a successfull install you should have `go-caelum` as a directory alongside `Apollo`.

Optional: create a directory to store the masternode/chain data:
`mkdir YOUR_DATADIR`

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

 Hint! You can run all these actions in one go by running `bash apollo.sh start`. This executes all needed steps in a single command.

 Enter any key in your console to let the masternode run in the background.

 Check if you are displayed on our stats page https://stats.testnet.caelumfoundation.com/

 Send our developers a DM to receive some testnet tokens in order to activate and setup your masternode.

 Subscribe to the Telegram channel for updates/instructions as masternode owner https://t.me/joinchat/AAAAAFankV-nfwLbBRbHMw

---

### Setting up a masternode with no initial masternode address

`bash apollo.sh start` for the first time.

It will ask you if you want to create a new coinbase account, or import an existing one.

The password will be saved in `/Apollo/.pwd` and the address will be saved in `/Apollo/testnet.env`.

Complete the setup helper. This will then start the node and begin syncing.

### Setting up a masternode with an existing masternode address (importing)

Run `bash apollo.sh import` and follow the steps.

### Connecting to our testnet with MetaMask

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
