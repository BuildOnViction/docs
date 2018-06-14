# Masternodes

## Architecture
The Tomochain blockchain is produced and maintained by a set of masternodes in a consistent manner through the Tomochain consensus protocol as shown in Fig.1. These masternodes are full nodes that hold $TOMO. For a coin-holder to become a masternode, two requirements must be satisfied:
The coin-holder must hold at least a minimum required amount of coin (see next section for more details).
The coin-holder must be one of the most voted masternode candidates in the system. The voting by coin-holders is credited through a Voting DApp that allows coin-holders to send $TOMO through the smart contract mechanism.
In addition to the voting system which is an improvement over the current Bitcoin and Ethereum blockchain, Tomochain also provides a new technique, namely Double Validation complemented with a Randomization mechanism. This new technique significantly decreases the probability of having invalid blocks in the blockchain. These enhancements and the components of Tomochain are step-by-step detailed in the followings.

## Masternode functions

Coin-holder is as simple as its name: users who join the network, who own and transfer $TOMO. Masternodes are full-nodes which maintain a copy of the blockchain, produce blocks and keep the chain consistent. It is worth noting that, Tomochain does not have miners as in the current Proof-of-Work-based blockchain systems such as Bitcoin and Ethereum. Only masternodes can produce and validate blocks.
Masternodes are selected via a voting system. The first requirement of being masternodes is to deposit 50 000 $TOMO to the Voting Smart Contract. Then, these depositors are listed as masternode candidates in the Voting DApp, which allows coin-holders to vote for them by sending $TOMO to the smart contract.
Tomochain blockchain network

Masternodes which work hard in the system to create and verify blocks will be incentivized with
$TOMO. Furthermore, coin holders who vote for these incentivized masternodes will also receive $TOMO in proportion to the amount of $TOMO they have invested via ballots. Tomochain engineers take responsibility to design that fair, explicit, automated and accountable reward mechanism.
The list of masternode candidates is dynamically sorted based on voted coins. The performance of the masternodes will be tracked and reported back to the coin holders in terms of three main metrics: CPU/Memory charts which ensure the workload of the masternodes, the number of signed blocks which indicates their work performance and the last signed block which figures out their last activity. Coin- holders, at any time, can unvote masternodes, who have  low performance, and give their votes to the other masternodes who have beter performance. Coin-holders have incentives to do that because their voted coins are seen as investment to their supported masternodes, thus they should choose a voting strategy in order to maximize their profit from the investment.
This simple trick keeps the system healthy since masternodes always have to race for their position so that all weak masternodes will eventually be eliminated. Therefore, only the strongest masternodes are voted and can flourish.