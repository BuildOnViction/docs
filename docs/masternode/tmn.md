We made a simple command line interface called [tmn](https://github.com/tomochain/masternode) to easily and quickly start a TomoChain masternode.
It takes care of starting the necessary docker containers with the proper settings for you.
It will really suit you if you don't already have a big infrastructure running.
Spin up a machine in your favorite cloud and get your masternode running in a few minutes!

## Prerequisites

Python >= 3.5 and Docker are required.

- [Python](https://docs.python-guide.org/starting/install3/linux/) >= 3.6
- [Docker CE](https://docs.docker.com/install/)

We recommand to run your masternode on Ubuntu 18.04 LTS.
This version have python 3.6 and has been reported as working out of the box.

### Installation of Python

To install Python under debian based distribution, run the following commands.
```
apt update

apt install python3-pip
```

To check if you have installed the right Python version (must be greater than 3.5).
```
python3 --version
```

![tmn python](/assets/tmn_python.png)

### Installation of Docker CE
 
To install Docker, first update the apt package index.
```
sudo apt update
```

Then Install packages to allow apt to use a repository over HTTPS.
```
sudo apt install apt-transport-https ca-certificates curl software-properties-common
```

Add Docker’s official GPG key.
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

Verify that you now have the key with the fingerprint `9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88`, by searching for the last 8 characters of the fingerprint.
```
apt-key fingerprint 0EBFCD88
```

![tmn docker key](/assets/tmn_key.png)

Set up the stable Docker repository.
```
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

Update the apt package index. Then install the latest version of Docker CE.
```
sudo apt update

sudo apt install docker-ce
```

Once installed, add your current user to the Docker group.
```
usermod -aG docker $your_user_name
```
!!! warning
    You need to relog into your account for this to take effect.

Verify that Docker CE is installed correctly by running the hello-world image:
```
docker run hello-world
```

This command downloads a test image and runs it in a container.
When the container runs, it prints an informational message and exits.

## tmn

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

When you first start your full node with tmn, you need to give some information.

`--name`: The name of your full node.
It should be formatted as a slug string.
Slug format authorize all letters and numbers, dashes ("-") and underscores ("\_").
You can name it to reflect your identity, company name, etc.

`--net`: The network your full node will connect to.
You can choose here to connect it to the TomoChain Testnet or Mainnet (once launched).

`--pkey`: The private key of the account that your full node will use.
A TomoChain full node uses an account to be uniquely identified and to receive transaction fee.

!!! note "Important note:"
	We advise for security measures to use a fresh new account for your masternode.
	This is not the account who will receive the rewards.
	The rewards are sent to the account who will make the 50k TOMO initial deposit.

It could look like this:
```
tmn start --name [YOUR_NODE_NAME] --net testnet --pkey [YOUR_COINBASE_PRIVATE_KEY]
```

Once started, you should see your node on the [stats page](https://stats.testnet.tomochain.com)!

Note: it can take up to one hour to properly sync the entire blockchain.

![tmn stats](/assets/tmn_stats.png)

## Usage

You can now interact with it via the other commands:

`stop`: Stop your full node.

`start`: Start your full node if it is stopped.

`status`: The current status of your full node.

`inspect`: Display the details related to your full node.
Useful for applying your full node as a masternode.

`remove`: Completely remove your masternode, unique identity and data.

## Troubleshooting

### tmn: command not found

It might happen that your PATH is not set by default to include the default user binary directory.
You can add it by adding it to your shell $PATH:

On GNU/Linux:
```
echo 'export PATH=$PATH:$HOME/.local/bin' >> $HOME/.bashrc
```

On MacOS:
Replace `[VERSION]` by your version of python (3.5, 3.6, 3.7)
```
echo 'export PATH=$PATH:$HOME/Library/Python/[VERSION]/bin' >> $HOME/.bashrc
```

### error: could not access the docker daemon

If you have installed Docker, you probably forgot to add your user to the docker group.
Please run this, close your session and open it again.

```
usermod -aG docker $your_user_name
```
