Running a masternode candidate require to pay attention to the team's announcements regarding updates and technical notices.

Here are the base recommendations for running a masternode candidate.

## Minimum hardware requirements {#hardware .unnumbered}

Processing transactions is mostly CPU bound.
Therefore we recommend running CPU optimized servers.

- Directly facing internet (public IP, no NAT)
- 16 cores CPU
- 32GB of RAM
- SSD storage

!!! note
    If you are running a node in Testnet, 2CPU/8GB of RAM is sufficient.

We recommend using popular cloud providers as there reliability and uptime are close to 100%.
Those servers would be a good starting point:

- **DigitalOcean**: CPU optimized droplet 32GB/16CPU
- **Amazon EC2**: C5 instance
- **Google Cloud Engine**: n1-highcpu-16

Setting up a masternode candidate on a weaker machine might result in poor performances.
Significantly impacting owner's rewards and the chain performance.

If you have other production grade environment than cloud provider at your disposal, please come chat with us on our [Gitter](https://gitter.im/tomochain).

!!! info Performances
    A masternode have a certain amount of tasks to process (validations, block creations, etc.) over time.
    You masternode should be able to process all the tasks that are attributed to him or the rewards will be negatively impacted.
    However, over sizing your masternode will not get you more rewards.

## Maintenance {#maintenance .unnumbered}

All IT systems require maintenance.

It is of the owner's responsability to ensure over time that your node has enough:

- disk space to store the new blockchain data
- processing power to keep the chain operating at optimal speed
- monitoring to be able to react quickly in case of problem
- security mesures like firewalling, os security patching, ssh via keypairs, etc.

This is a non exhaustive list.
