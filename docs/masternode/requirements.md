The **required deposit to become a masternode candidate is set at 50'000 TOMO.**
This amount is locked in a voting smart contract.
Only the **top 150 most voted candidates** every *epoch* (900 blocks) will become masternodes.
Masternodes which work hard in the system to create and verify blocks will be incentivized with TOMO.

Furthermore, token holders who vote for these masternodes will also receive TOMO in proportion to the amount they have invested via voting.
Token holders, at any time, can unvote candidates with low performance and give their votes to other candidates with better performance.
Token holders have incentives to do that because their voted tokens are seen as investment to their supported masternodes, thus they should choose a voting strategy in order to maximize their profit.

This simple trick keeps the system healthy since masternodes always have to race for their position so that all weak masternodes will eventually be eliminated.
Therefore, only the strongest masternodes are voted and can flourish.

The list of masternode candidates is dynamically sorted based on voted tokens.
The performance of the masternodes will be tracked and reported back to the token holders in terms of three main metrics: *CPU, Memory* and the *number of signed blocks* which indicates their work performance.
The *last signed block* also indicates the last activity.

It is in your best interest to **keep your masternode working efficiently** to help the network and to be voted and receive rewards.

If a masternode is demoted (leaving the top 150 most voted candidates) it will not be able to sign blocks and will not receive rewards.
Once a masternode intentionally resigns from his masternode role, he will not receive rewards and the deposit will remain locked for 30 days (1,296,000 blocks) after the resignation.

## General Hardware Notice {#hardware .unnumbered}

Our team extensively tested performances and came up with those minimal requirements for any TomoChain masternode host.

**Testnet**

- Must be facing internet directly (no NAT, public IP)
- Must have at least 2 cores
- Must have at least 8GB of RAM
- Must use an IaaS ("cloud") provider of your choice (AWS, Digital Ocean, Google Cloud, etc.).
- Storage must be SSD

**Mainnet**

- Must be facing internet directly (no NAT, public IP)
- Must have at least 8 cores
- Must have at least 32GB of RAM
- Must use an IaaS ("cloud") provider of your choice (AWS, Digital Ocean, Google Cloud, etc.)
- Storage must be SSD

We recommand prioritizing CPU. For example with Digital Ocean, pick a CPU optimized droplet. On AWS EC2, an C5 type instance would be a perfect match.

If you have other production grade environment than cloud provider at your displosal, please tell us more about on our [Gitter](https://gitter.im/tomochain).

## Getting Elected as a Masternode {#getting-elected .unnumbered}

Only **the top 150 most voted candidates** every period of 900 blocks called *epoch* will be promoted to masternodes, being able to sign blocks and receiving rewards.
This list will dynamically change every epoch (~30 minutes), removing weak underperforming nodes and promoting the efficient ones.
All masternodes must keep the highest standards of quality if they want to be reelected and maintain their status and the rewards.

The main points candidates -to be voted- and voters -when choosing a candidate- should take into consideration are the following:

### Raw machine performances
The theoretical power (the hardware) and actual performances (CPU and Memory usage) between masternodes will indicate strong masternodes.
As more and more DApps will use TomoChain, the load on each masternode will ramp up.

A node who is constantly using 70% of its CPU power will probably get into more troubles if the load on the blockchain goes up than a node who's currently at 20%.

There are also other technical factors such as latency or bandwidth.

### Work
For candidates that are already promoted as masternode, you can check if they are fulfilling their duty via each candidate page.
You can check when the last signing happened to see if masternode is indeed online doing his job.
You can compare the rewards with other masternodes to see if the node is doing the same amount of work.

### Current stacking
When voting for a masternode candidate, voters might not want to vote for the most voted candidates as it will greatly reduce the rewards they will receive.
As voting rewards are split between voted TOMO, the more TOMO stacked, the less reward they individually grant.

*For example, voting 10'000 TOMO on a masternode A with 100'000 TOMO already stacked will earn the voter more rewards than voting 10'000 TOMO on a masternode B with 1'000'000 TOMO stacked.
At the same performances, the voter would earn 10 times more if he votes for masternode A.*

### Reputation
There are also social factors such as reputation.
*A candidate run by a "trusted" company or partner.
Or a node with a track record of excellent performance and correct maintenance.*
Nodes with good reputation will be favoured by voters.

This one might be the most subjective point.
A candidate being owned by a "trusted" company can still encounter problems and be poorly managed.
In any case, it might still be a factor as some people might have more experience maintaining IT infrastructures than others.

## Maintenance of your Masternode {#maintenance .unnumbered}

It is also **important to keep an adequate maintenance of your node.**
Otherwise your node may stop working properly and decrease its efficiency signing blocks.
Lazy masternodes can dramatically decrease the performance of the whole network and cause network instability. 

A *lazy masternode* is a masternode that does not sign/verify any blocks during the entire epoch within which it is elected.
Some reasons for this might be that the masternode does not have the correct TomoChain software or the masternode crashes due to the lack of e-maintenance and operation by the masternode owner.

Lazy masternodes will be eliminated out of the masternodes list because normally token-holders will unvote them and will choose the best performing masternodes to maximize their profits from voting.

TomoChain also has a *Slashing Mechanism* solution to mitigate the aforementioned issue to keep the system stable and performing.
If a masternode does not sign any block during an entire epoch, the masternode will be 'kicked out' of the masternode list for the next 4 epochs and does not have the right to create blocks or receive rewards.
