With the recent release of TomoChain Testnet 2.0 with our PoSV consensus, you might be interested in creating a TomoChain full node and applying it to be a masternode.

To run a full node and meet the requirements to apply on our governance DApp, you have to run two services:

- The [TomoChain client](https://github.com/tomochain/tomochain), our TomoChain implementation written in _Go_.
- [Telegraf](https://github.com/influxdata/telegraf), an agent to collect performance metrics of your full node.

## General hardware notice

Our team extensively tested performances and came up with those minimal requirements for any TomoChain masternode host.

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

If you have other production grade environment than cloud provider at your displosal, please tell us more about on our [Gitter](https://gitter.im/tomochain).

## tmn

We made a simple command line interface called [tmn](https://github.com/tomochain/masternode) to easily and quickly start a TomoChain masternode.
It takes care of starting the necessary docker containers with the proper settings for you.
It will really suit you if you don't already have a big infrastructure running.
Spin up a machine in your favorite cloud and get your masternode running in a few minutes!

### Prerequisites

To use tmn, you should meet these requirements in addition to the hardware ones:

- [Docker CE](https://docs.docker.com/install/)
- [Python](https://docs.python-guide.org/starting/install3/linux/) >= 3.5

### Installation

Simply install it from pip.

```
pip3 install --user tmn
```

### Update

Update it from pip.

```
pip3 install -U tmn
```

### First start

When you first start your full node with tmn, you need to give some informations.

`--name`: The name of your full node.
It should be formatted as a slug string.
Slug format authorize all letters and numbers, dashes ("-") and underscores ("\_").
You can name it to reflect your identity, company name, etc.

`--net`: The network your full node will connect to.
You can choose here to connect it to the TomoChain Testnet or Mainnet (once launched).

`--pkey`: The private key of the account that your full node will use.
A TomoChain full node uses an account to be uniquely identified and to receive transaction fee.
**Important note:** we advise for security measures to use a fresh new account for your masternode.
This is not the account who will receive the rewards.
The rewards are sent to the account who will make the 50k TOMO initial deposit.

It could look like this:

```
tmn start --name [YOUR_NODE_NAME] \
    --net testnet \
    --pkey [YOUR_COINBASE_PRIVATE_KEY]
```

Once started, you should see your node on the [stats page](https://stats.testnet.tomochain.com)!

Note: it can take up to one hour to properly sync the entire blockchain.

### Usage

You can now interact with it via the other commands:

`stop`: Stop your full node.

`start`: Start your full node if it is stopped.

`status`: The current status of your full node.

`inspect`: Display the details related to your full node.
Useful for applying your full node as a masternode.

`remove`: Completely remove your masternode, unique identity and data.

### Troubleshooting

#### tmn: command not found

It might happen that your PATH is not set by default to include the default user binary directory.
You can add it by adding it to your shell $PATH:

On GNU/Linux:
```
echo 'export PATH=$PATH:~/.local/bin' >> ~/.bashrc
```

On MacOS:
Replace `[VERSION]` by your version of python (3.5, 3.6, 3.7)
```
echo 'export PATH=$PATH:~/Library/Python/[VERSION]/bin' >> ~/.bashrc
```

#### error: could not access the docker daemon

If you have installed Docker, you probably forgot to add your user to the docker group.
Please run this, close your session and open it again.

```
usermod -aG docker $your_user_name
```
