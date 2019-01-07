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

---

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
Root; passwd; adduser; usermod; assure groups

Login to your newly created server with SSH / Putty.  
If you need help with this, [see this example](https://medium.com/tomochain/how-to-run-a-tomochain-masternode-from-a-to-z-3793752dc3d1#20a7).

```shell
ssh root@178.62.127.177
```
> Note on Users: Login as the `root` user at first.
Later, we will create and switch to your own username.

If you did not utilize SSH-key login (highly recommended), you will want to change the root password (only the first time).
As a security feature, many providers have a mandatory change of the password the first time you log in with your root user.
In this case, you will be asked to input your current password, and enter a new one (it is strongly recommended to use a 16+ char password with a mix of letters, numbers, special characters).

If you are not asked to change your password on the first connection, you can initiate this yourself (it is highly recommended that you change the default password with a new one) by entering the command `passwd` followed by ENTER.

```shell
$ passwd
Enter new UNIX password:
Retype new UNIX password:
```

You will be prompted to enter a new password and then retype the same password to confirm.

> Save your root password as you can get locked out of your own server if you forget it.

You are now logged in as root.
The root user is the administrative user in a Linux environment that has very broad privileges.
Because of the heightened privileges of the root account, you are _discouraged_ from using it on a regular basis.
This is because part of the power inherent with the root account is the ability to make very destructive changes, even by accident.

The next step is to [set up an alternative user account](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-18-04) with a reduced scope of influence for day-to-day work.

### Create a new user. 
Use the following command to add a new user account that we will use to log in to from now on.
Our user is called michael, you can replace it with any username that you like:

```shell
adduser michael
```

You will be asked a few questions, starting with the account password.
Enter a strong password.
Optionally, fill in any of the additional information if you want or ignore it.
This is not required and you can just hit ENTER in any field you wish to skip.

### Grant the user administrative privileges.
Now, we have a new user account with regular account privileges.
However, we will need to do administrative tasks from this normal account.

To add these privileges to our new user, we need to add the new user to the **sudo** group.
This will allow our normal user to run commands with _administrative privileges_ by putting the word `sudo` before each command.

As root, run this command to add your new user to the sudo group (substitute the highlighted word with your new user):

```shell
usermod -aG sudo michael
```

Now, when logged in as your regular user, you can type `sudo` before commands to perform actions with superuser privileges.

### You can switch to the new user by typing:

```shell
su - michael
```


## 4. Configure your VPS (as root)
Apt update, python3, ufw (mention only), fail2ban (mention only)

## 5. Setup Docker (as new user)
Dependencies, download, install, test hello-world

## 6. Installing TMN utility
Pip, install, $PATH, troubleshooting

## 7. Create Wallet Addresses
Coinbase (dummy account); Deposit (50k account); Various wallet options; Links elsewhere

## 8. Run TMN and check sync status
Tmn start; tmn status; inspect; top; stats.tomo website; # of blocks command

## 9. Apply for Masternode Candidacy
Explain; Assure synced; master.tomo; login; apply

## 10. Name your Masternode
Master.tomo; login as 50k address; find your MN; edit; enter name; sign data

## 11. Verify initial rewards
Master.tomo; scan.tomo; explain infra vs stake reward; link to economics
