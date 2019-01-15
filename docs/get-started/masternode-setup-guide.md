# Tomochain Masternode Setup Guide

This is a procedural step-by-step guide to setting up your first Tomochain Masternode using the `tmn` tool.
It is meant for beginners and first-timers.

Security Disclaimer: Despite there being mention of some security elements in this guide, there is **no implied guarentee of security**. You alone must fully secure your server. On a VPS, you will get rogue root login attempts within minutes of setup.


## Knowledge Requirements
 * **VPS Setup** - You are able to setup your own cloud-hosted virtual private server (VPS), and 
 * **Linux familiarity** - You have a basic knowledge of how to ssh-into (ex: putty or terminal) and operate the linux command-line.

   **Do not proceed if you are not confident** with the Linux command-line. 
   Why?
   The upkeep and troubleshooting will become more complex than this guide.
   Some commands fail and you must know what you are doing.

## Technical Requirements / Recommendations
The following are required items and server specifications. 
[Click here for more details](https://docs.tomochain.com/masternode/requirements/)

 * 50,000 Tomo deposit
 * Server (cloud-VPS or your-own)
   * 16xCPU cores (CPU-optimized aka high-Ghz)
   * 32GB RAM
 * Storage (Disk Space)
   * 100+ GB for Linux operating system
   * 10GB / day of increasing data storage space (reccomend SSD-based Block Storage; low-latency, not NAS speeds)
 * 2 Tomo Addresses (see below)
 

## Introduction

### What is a masternode?
A masternode is a computer on a decentralized blockchain network that is running 24 hours a day that keeps the system operating.
It powers the blockchain network by processing transactions and signing blocks.

### What are the benefits of a masternode?
Masternodes help support the network by creating and signing blocks, providing faster transaction times, and decentralized operations.
They utilize PoS (Proof of Stake) vs PoW (Proof of Work) consensus-building.
Masternode operators are paid a reward (coins) as an incentive for their involved investment of coin-deposit, server setup, and continued operation.

### What is a VPS?
VPS stands for Virtual Private Server.
They are paid servers hosted on a cloud-hosting-provider.
Each VPS runs an independent installation of an operating system (OS), Linux or Windows, and typically provides root access to the OS for advanced management and control.

### Why is a VPS highly recommended for masternodes?
A VPS is recommended (and often required) for masternode setups, as you will need a dedicated static IP and 99.9% uptime to provide a stable and efficient node for the cryptocurrency’s network.
Unlike your home or office PC, a masternode VPS serves one purpose, to securely and efficiently run a masternode.
A VPS is online 24/7 and provides dedicated resources for the project’s decentralized network.

---

## 1. Choose your hosting provider
Choose which VPS hosting provider you want to utilize.

The following providers are **sample** VPS providers.
You could choose elsewhere, or even your own 24/7 server.

 * [Vultr (Beginner friendly)](https://www.vultr.com/)
 * [DigitalOcean (Popular)](https://www.digitalocean.com/)
 * [AWS (Amazon)](https://aws.amazon.com/)
 * [OVH (Cheap)](https://www.ovh.com)
 * [GCE (Google)](https://cloud.google.com/compute/)
 * [Linode (Linux geek crowd)](https://www.linode.com/)

> Note on provider choice: It is encouraged for masternode operators to utilize various hosting providers so as to encourage a more decentralized network.
We have noticed that DigitalOcean has been a very popular choice, however, if this popular provider goes down, others will get more rewards :-)

## 2. Start your VPS server
**Start/Boot your VPS server instance.**  
Choose **Ubuntu 18.04**.
This is an LTS version (Long Term Support).
LTS versions are more stable and have seen less errors when installing Docker and Python.
You must use Ubuntu 18.04 to seek support from the wider community or Tomochain.
If you need help with this, [see this example](https://medium.com/tomochain/how-to-run-a-tomochain-masternode-from-a-to-z-3793752dc3d1#6122).

> Data Storage: It is recommended to assure that your provider has Block Storage or expandable disk space on SSD drives (more performant).
Block Storage is pay-as-you-go disk space that you can expand in the future.
You may not need it now, but you will in the future.
Some locations within a hosting provider do not have this, while others will.

> SSH-Key login: Seriously consider utilizing a **SSH-Key login** over passwords.
Some providers allow you to set it up upon server creation.
It is considerably more secure than passwords.
Within 60 mins of your server being up, random hackers will be trying to login with guessed-passwords.


## 3. Change passwords and accounts (as root)
Login to your newly created server with SSH / Putty.  
If you need help with this, [see this example](https://medium.com/tomochain/how-to-run-a-tomochain-masternode-from-a-to-z-3793752dc3d1#20a7).

```shell
ssh root@178.62.127.177
```
> Note on Users: Login as the `root` user at first.
Later, we will create and switch to your own username.

If you did not utilize SSH-key login (highly recommended), you will want to change the root password (only the first time) with the following command.

```shell
passwd
```

> Save your root password as you can get locked out of your own server if you forget it.
It is strongly recommended to use a 16+ char password with a mix of letters, numbers, special characters.

You are now logged in as root.
The root user is the administrative user in a Linux environment that has very broad privileges.
Because of the heightened privileges of the root account, you are _discouraged_ from using it on a regular basis.
This is because part of the power inherent with the root account is the ability to make very destructive changes, even by accident.

The next step is to [set up an alternative user account](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-18-04) with a reduced scope of influence for day-to-day work.

### Create a new user
Use the following command to add a new user account that we will use to log in to from now on.
Our user is called michael, you can replace it with any username that you like.
Use the same username as your local mac/PC username and you will have an easier time logging in!

```shell
adduser michael
```

You will be asked a few questions, starting with the account password.
Enter a strong password.
Optionally, fill in any of the additional information if you want or ignore it.
This is not required and you can just hit ENTER in any field you wish to skip.

### Grant the user administrative privileges
Now we have a new user account with regular account privileges.
However, we will need to do administrative tasks from this normal account.

To add these privileges to our new user, we need to add the new user to the **sudo** group.
This will allow our normal user to run commands with _administrative privileges_ by putting the word `sudo` before each command.

As root, run this command to add your new user to the sudo group (substitute michael with your new user):

```shell
usermod -aG sudo michael
```

> -a stands for Append and -G is Group; sudo is the groupname you are adding to your user

### Assure the user received sudo
Lets check to make sure that the usermod command worked.

```shell
cat /etc/group | grep sudo
```

> cat shows the text contained in the file /etc/group; | (pipe) sends that text to grep, which returns only lines with the text "sudo" in them.
Otherwise, the files contents are long and full of groups and users

Assure that you get a response such as `sudo:x:27:michael`.
This shows your new user (amongst other users) in the sudo group. 

To double check the sudo abilities of your new user, run this command:

```shell
groups michael
```

Assure that you get a response such as `michael : michael sudo` from the second command. 
This shows that michael is part of multiple groups, one being named the same as their username and the other being sudo.
Success!

When you eventually (not yet) log in as your new user, you can type `sudo` before commands to perform actions with superuser privileges.
Remain logged in as the root user for now, as we have more initial setup to do. 
After this, you will almost always login as your new user.


## 4. Configure your VPS (as root)
We will now prepare the [prerequisites for tmn](https://docs.tomochain.com/get-started/run-node/).
You need Python 3.6+ and Docker installed.

### Upgrade operating system

We should upgrade the Ubuntu operating system and all installed package libraries first.
You may consider doing this upgrade occasionally  in the future.
Type these two commands on the console with an ENTER after each:

```shell
apt update
apt upgrade
```
> Watch out for WARNINGs or ERRORs. 
A lot of text could fly by, and you should watch all of it in case something installs incorrectly.
Google anything out of the ordinary and try to understand or fix it.

Reboot your VPS instace in case any of the upgraded components will only fully engage until rebooted fresh.

```shell
reboot
```

### Install Python

```shell
apt install python3
apt install python3-pip
```

Check if you have installed the right Python version (must be newer than version 3.6).

```shell
python3 --version
```

### Configure security (optional, but highly recommended)

> THESE SECURITY STEPS ARE NOT EXHAUSIVE.
YOU SHOULD RESEARCH MORE.
YOU ARE RESPONSBILE, NOT ANYONE ELSE.

You will want to secure your machine with multiple levels of security. 
Within a few minutes of the machine being up, bots and hackers attempt to login and probe it for weakness.

At a minimum, you will want to setup UFW (Uncomplicated Fire Wall) and fail2ban.

The below commands give an example of how to set this up.

```shell
apt install ufw
ufw allow ssh/tcp
ufw limit ssh/tcp
ufw allow 30303/tcp
ufw allow 30303/udp
ufw logging on
ufw enable
ufw status
```

> Port 30303 is the only port required for use by tomo.
There is optional ports 8595 and 8596 tcp that can be used for the API, however opening the API is a security risk and only for advanced users.

```shell
apt install fail2ban
echo -e "# Permanently ban 5+ tries\n[DEFAULT]\nbantime = -1\n\n[sshd]\nenabled = true\nport = ssh\nfilter = sshd\nlogpath = /var/log/auth.log\nmaxretry = 5" > /etc/fail2ban/jail.local
systemctl start fail2ban
systemctl enable fail2ban
fail2ban-client reload
fail2ban-client status sshd
```

> Note that the above permanently bans any shh connection trying more than 5 times; this includes yourself

## 5. Setup Docker (as new user)
Dependencies, download, install, test hello-world

From now on, you will almost always want to login as your new user.
If you are logged in as root still, logout and log back in as the new user.
You may want to consider denying remote root ssh logins.

```shell
ssh michael@178.62.127.177
```

### Install Docker Repositories
Update the apt package index.
Then install various packages to allow apt to use a repository over HTTPS.
The third line adds Docker’s official GPG key.

```shell
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

> "OK" is normal output of that last command; -fsS shows less progress, but still error messages and -L allows redirect

> NOTE: Be careful with certain ssh consoles.
They may not paste the ‘|’ symbol correctly.

Next, verify that you have the correct key, by searching for the last 8 characters of the fingerprint.
Compare the results to what is below.

```shell
apt-key fingerprint 0EBFCD88
```

Example Results (format may be slightly different, but the string of char-numbers the same):
```
pub   rsa4096 2017-02-22 [SCEA]
      9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
uid           [ unknown] Docker Release (CE deb) <docker@docker.com>
sub   rsa4096 2017-02-22 [S]
```

Use the following command to set up the "stable" repository.
You could get errors here if you have a release of Ubuntu that is too recent (non LSB).

```shell
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

### Install Docker CE
Update the apt package index.
Then install the latest version of Docker CE:

```shell
sudo apt update
sudo apt install docker-ce
```

> Watch out for WARNINGs or ERRORs. 
Google anything out of the ordinary and try to understand or fix it.

Once installed, add your current user to the Docker group and verify that the user has been added.

```shell
sudo usermod -aG docker michael
groups michael
cat /etc/group | grep docker
```

Verify that Docker CE is installed correctly by running the hello-world image.

```shell
sudo docker run hello-world
```

This command downloads a test image and runs it in a container.
When the container runs, it prints an informational message and exits.
**Docker CE is installed and running.**

Congratulations! You have already installed Python and Docker.
You have the prerequisites ready to run TomoChain’s tmn.

********************
TROUBLESHOOTING

error: could not access the docker daemon

If you have installed Docker, and get this error, you probably forgot to add your user to the docker group.
Please run this, close your session and open it again.

`usermod -aG docker $your_user_name`
********************


## 6. Installing TMN utility
FIXME Pip, install, $PATH, troubleshooting

`Tmn` is a simple interface created by TomoChain developers to **help you quickstart your masternode**.
It is installed as a python package and it utilizes two docker containers once operating.
We will follow through the steps found here: [guide to install tmn](https://docs.tomochain.com/get-started/run-node/)

> “We made a simple command line interface called tmn to easily and quickly start a TomoChain masternode.
It takes care of starting the necessary docker containers with the proper settings for you.
It will really suit you if you don’t already have a big infrastructure running.
Spin up a machine in your favorite cloud and get your masternode running in a few minutes!”

Install and update the tomochain-created `tmn` utility from pip:

```shell
pip3 install --user tmn
pip3 install -U tmn
```

> Watch out for WARNINGs or ERRORs and troubleshoot.

Check that `tmn` has been correctly installed, use the following command to show some tmn info:

```shell
pip3 show tmn

Name: tmn
Version: 0.2.5
Summary: Quickstart your masternode
Home-page: https://tomochain.com
Author: Etienne Napoleone
Author-email: etienne@tomochain.com
License: GPL-3.0+
Location: /root/.local/lib/python3.6/site-packages
Requires: clint, pastel, python-slugify, docker, click
```

The next step will be to actually **START TMN**, however we cannot do this until we have two wallet addresses.
See the next section for this.

********************
TROUBLESHOOTING

FIXME extra packages might need installing
*******************


## 7. Create Wallet Addresses
Before being able to proceed further, you will need **two** seperate Tomo addresses to operate a masternode.
One is like an ID/placeholder/dummy for the Masternode, and the other is where the 50,000 TOMO (50k) is staked from.

* **ADDR1 - MN Address** - ID/placeholder/dummy - No coins need to be in this wallet; it can remain empty
* **ADDR2 - Deposit**    - 50k Holder           - Put your staked coins here; later the 50k will go into a smart contract; rewards will show here

You will need both the **Public Key** and **Private Key** for both addresses.
It is advise that you store all of this information somewhere safe, yet accessible.
You may need to utilize this information during continued operations of your masternode.
Password manager apps like LastPass and 1Password are your friend.
Your private key is your money.
Give it to no one.

> ADDR1 Suggestions:  
If setting up a single masternode, you can use a mobile wallet.
Binances `Trust Wallet` and Tomochains `Tomo Wallet` app are best.
Alternatives are Metamask and MEW (MyEtherWallet), in that order.
You can use Ledger Hardware Wallet, however the added security on ADDR1 isnt as necessary.

> ADDR2 Suggestions:  
Preferred to use Ledger / Hardware Wallet in combo with Metamask because 50k will be here.
Assure to use an address you dont have history on eth chain with - otherwise other will be able to see your investment history.

Because most wallets do not have Tomo as a selectable network yet, you will need to manually add the new mainnet if you have not already. 
See the first link below for the guide on how to do this.

Links for more info:
* [ADVISED: SETTING UP METAMASK or MEW or TRUSTWALLET](http://bit.ly/2A6zrC7)
* [Using Metamask or Mobile Tomo Wallet](https://docs.tomochain.com/get-started/wallet/)
* [Links to mobile downloads and other tomo info](https://medium.com/tomochain/tomochain-all-in-one-overview-9fce16e13b5#6b8c)
* [Old Masternode guide (testnet) Section on wallets](https://medium.com/tomochain/how-to-run-a-tomochain-masternode-from-a-to-z-3793752dc3d1#0e58)


## 8. Run TMN and Jumpstart chain data
FIXME Tmn start; Etienne's Chaindata jumpstart

Below, you will start `tmn` initially, to get files in place, and then **"Jumpstart"** it with a seperate set of commands. 
Jumpstarting allows you to not have to download the large chaindata from peers.
Getting an initial seed of the data, and going from there is considerably faster.
However, first, lets start `tmn` for the first time.

### Initial TMN start
**IMPORTANT:** Logout and SSH back in so that the $PATH variable takes effect.
This allows you to run `tmn` from any directory.

```shell
exit
```

When you first start your full node with `tmn start`, you need to give some information.

> **--name:** The name of your full node. It should be formatted as a slug string. Slug format allows all letters and numbers, dashes ("-") and underscores ("_"). You can name it to reflect your identity, company name, etc.  
>  
> **--net:** The network your full node will connect to. You can choose here to connect it to the TomoChain `mainnet` or `testnet`.  
>  
> **--pkey:** The private key of your ADDR1 wallet. A TomoChain full node uses an account to be uniquely identified and to receive transaction fees. Transaction fees are not rewards, and they are usually tiny. Important note: we advise for security measures to use a fresh new account for your masternode. This is not the account that will receive the rewards. The rewards are sent to the account that will make the 50k TOMO initial deposit.

The command is structured like this:

```shell
tmn start --name [YOUR_NODE_NAME] --net mainnet --pkey [YOUR_ADDR1_PRIVATE_KEY]
```

We used the following command for our node (copy your own **name** & **private key**):

```shell
tmn start --name Atlantis --net mainnet --pkey cf03cb58************
```

### Jumpstart the chaindata (Optional, but very advised)
The basic structure has been created and now we want to speed up the process by pulling in the latest chaindata.

[Jumpstart instructions can be found here](https://gist.github.com/etienne-napoleone/5dac3f7654f01c05d54b5e7a114ab29d)


********************
TROUBLESHOOTING

`tmn: command not found`

It might happen that your PATH is not set by default to include the default user binary directory. You can add it by adding it to your shell $PATH:

On GNU/Linux:

echo "export PATH=$PATH:$HOME/.local/bin" >> $HOME/.bashrc
*******************


## 9. Check sync status
FIXME tmn status; inspect; top; stats.tomo website; # of blocks command; `tmn update`, `tmn --help`, etc

## 9. Apply for Masternode Candidacy
FIXME Explain; Assure synced; master.tomo; login; apply

## 10. Name your Masternode
FIXME Master.tomo; login as 50k address; find your MN; edit; enter name; sign data

## 11. Verify initial rewards
FIXME Master.tomo; scan.tomo; explain infra vs stake reward; link to economics
