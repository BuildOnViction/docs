This is a procedural step-by-step guide to setting up your first Tomochain Masternode.
It is meant for beginners and first-timers.

**Pre-requisite knowledge:**
 * **VPS Setup** - You can setup your own cloud-hosted virtual private server (VPS), and 
 * **Linux familiarity** - You have a basic knowledge of how to ssh-into (ex: putty or terminal) and operate the linux command-line.

**Do not proceed if you are not confident** with the Linux command-line.
Why?
The upkeep and troubleshooting will become more complex than this guide. 
Some commands fail and you must know what you are doing.

## Requirements
Give basics; Link off to https://docs.tomochain.com/masternode/requirements/

50k Tomo; 16xCPU cores; 32GB RAM; 400 GB SSD storage (10GB / day of increasing space); 2 Tomo Addresses

## Introduction
About masternodes and why...; What? Benefits; VPS

## Start your VPS
VPS Choices; Links to examples; Links to SSH login guide

**Note:** it is recommended to assure that your provider has Block Storage or expandable disk space on SSD drives (more performant).
Block Storage is pay-as-you-go disk space that you can expand in the future.
You may not need it now, but you will in the future.
The tomo blockchain will eventually grow to be many hundreds of gigabytes and even a terrabyte.
As of Jan 2019, it is ~100 GB in size. This has nothing to do with RAM.

## Change passwords and accounts
Root; passwd; adduser; usermod; assure groups

## Configure your VPS (as root)
Apt update, python3, ufw, fail2ban

## Setup Docker (as new user)
Dependencies, download, install, test hello-world

## Installing TMN utility
Pip, install, $PATH, troubleshooting

## Create Wallet Addresses
Coinbase (dummy account); Deposit (50k account); Various wallet options; Links elsewhere

## Run TMN and check sync status
Tmn start; tmn status; inspect; top; stats.tomo website; # of blocks command

## Apply for Masternode Candidacy
Explain; Assure synced; master.tomo; login; apply

## Name your Masternode
Master.tomo; login as 50k address; find your MN; edit; enter name; sign data

## Verify initial rewards
Master.tomo; scan.tomo; explain infra vs stake reward; link to economics
