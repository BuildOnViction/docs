# Running a masternode

With the recent release of Tomochain Testnet 2.0 with our PoSV consensus, you might be interested in creating a Tomochain fullnode and applying it to be a masternode.

To run a fullnode and meet the requirements to apply on our governance DApp, you have to run two services:
- The [Tomochain client](https://github.com/tomochain/tomochain), our Tomochain implementation written in _Go_.
- [Telegraf](https://github.com/influxdata/telegraf), an agent to collect performance metrics of your fullnode.

We provide different way of running a node to assure flexibility in integration depending on your current infrastructure.

## General hardware specifications

Our team extensively tested performances and came up with those minimal requirements for any Tomochain masternode host:

- Should be facing internet directly (no NAT, public IP)
- Should have at least 8 core, 16 threads at 2.5Ghz
- Should have at least 8 Go of RAM
- Storage should be of SSD type

## tmn

We made a simple command line interface called [tmn](https://github.com/tomochain/masternode) to easily and quickly start a Tomochain masternode.
It takes care of starting the necessary docker containers with the proper settings for you.
It will really suits you if you don't already have a big infrastructure running.
Spin up a machine in your favorite cloud and get your masternode running in a few minutes!

### Prerequisites

To use tmn, you should meet this requirements in addition of the hardware ones:

- [Docker CE](https://docs.docker.com/install/)
- [Python](https://docs.python-guide.org/starting/install3/linux/) >= 3.6

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

When you first start your fullnode with tmn, you need to give some informations.

`--name`: The name of your fullnode.
It should be formated as a slug string.
Slug format autorize all letters and numbers, dashes ("-") and underscore ("_").
You can name it to reflect your identity, company name, etc.
#TODO

`--net`: The netowrk your fullnode will connect to.
You can chose here to connect it to the Tomochain Testnet or Mainnet (once launched).

`--pkey`: The private key of the account that your fullnode will use.
A tomochain fullnode use an account to be uniquely identified and to receive rewards.

It could look like this.

```
tmn start --name companyabcd --net testnet --pkey b9d3b1d2d65f928db8124eec2374ca542c283d81b35152e7b538bc7a2219d116
```

Once started, you should see your node on the [stats page](https://stats.testnet.tomochain.com)!

Note: it can take up to 15 minutes to properly end the first syncd

### Usage

Once your node is started, it

## Docker images

## Binaries
