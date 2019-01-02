# Tomochain Masternode Setup Guide

This is a procedural step-by-step guide to setting up your first Tomochain Masternode using the `tmn` tool.
It is meant for beginners and first-timers.

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

## 1. Start your VPS
Choose which VPS hosting provider you want to utilize.

The following providers are **sample** VPS providers.
You could choose elsewhere, or even your own 24/7 server.

 * [Vultr](https://www.vultr.com/)
 * [DigitalOcean](https://www.digitalocean.com/)
 * [AWS (Amazon)](https://aws.amazon.com/)
 * [OVH](https://www.ovh.com)
 * [GCE (Google)](https://cloud.google.com/compute/)
 * [Linode (Linux geek crowd)](https://www.linode.com/)

> Note on VPS location choice: It is encouraged for masternode operators to utilize various hosting providers and hosting locations (not only Asian hosting locations), so as to encourage a more decentralized network.
When Asia goes down, you will get more rewards :-)

**Start/Boot your VPS server instance.**  
If you need help with this, [see this example](https://medium.com/tomochain/how-to-run-a-tomochain-masternode-from-a-to-z-3793752dc3d1#6122).

> Note on Data Storage: It is recommended to assure that your provider has Block Storage or expandable disk space on SSD drives (more performant).
Block Storage is pay-as-you-go disk space that you can expand in the future.
You may not need it now, but you will in the future. Some locations within a hosting provider do not have this, while others will.

> Note on Security: Seriously consider utilizing a SSH-Key login. Some providers allow you to set it up upon server creation. It is considerably more secure than passwords. Within 60 mins of your server being up, random hackers will be trying to login with guessed-passwords.

Login to your newly created server with SSH / Putty.  
If you need help with this, [see this example](https://medium.com/tomochain/how-to-run-a-tomochain-masternode-from-a-to-z-3793752dc3d1#20a7).

```shell
ssh root@123.45.6.7
```

> Note on Users: Login as the `root` user at first. Later, we will create and switch to your own username.


## 2. Change passwords and accounts
Root; passwd; adduser; usermod; assure groups

## 3. Configure your VPS (as root)
Apt update, python3, ufw, fail2ban

## 4. Setup Docker (as new user)
Dependencies, download, install, test hello-world

## 5. Installing TMN utility
Pip, install, $PATH, troubleshooting

## 6. Create Wallet Addresses
Coinbase (dummy account); Deposit (50k account); Various wallet options; Links elsewhere

## 7. Run TMN and check sync status
Tmn start; tmn status; inspect; top; stats.tomo website; # of blocks command

## 8. Apply for Masternode Candidacy
Explain; Assure synced; master.tomo; login; apply

## 9. Name your Masternode
Master.tomo; login as 50k address; find your MN; edit; enter name; sign data

## 10. Verify initial rewards
Master.tomo; scan.tomo; explain infra vs stake reward; link to economics
