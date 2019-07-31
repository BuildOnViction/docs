# TOMOCHAIN - The Most Efficient Blockchain for the Token Economy

## Preface

### TomoChain's vision and mission

Our mission is to be a leading force in building the Internet of Value, and its infrastructure. 
We are working to create an alternative, scalable financial system which is more secure, transparent, efficient, inclusive and equitable for everyone.

TomoChain is an innovative solution to the scalability problem with the Ethereum blockchain, and other current blockchain platforms. 
TomoChain relies on a system of 150 Masternodes with Proof of Stake Voting (PoSV) consensus that can support near-zero fee, and 2-second transaction confirmation time. 
Security, stability and chain finality are guaranteed via novel techniques such as double validation, staking via smart-contracts and "true" randomization processes. 

TomoChain supports all EVM-compatible smart-contracts, protocols, and atomic cross-chain token transfers. 
New scaling techniques such as sharding, EVM parallelisation, private-chain generation, hardware integration will be continuously researched and incorporated into TomoChain's Masternode architecture which will be an ideal scalable smart-contract public blockchain for decentralized apps, token issuances and token integrations for small and big businesses.

### Scope

This document describes TomoChain’s initial draft for the TomoChain blockchain’s economics system.

## Masternodes

- **Masternodes** are full-nodes that create, verify and validate new blocks in TomoChain’s platform. 

- **Masternode Candidate**: Any account can deposit 50K TOMO using the official on-chain governance d-app to become a Masternode Candidate. 
50K TOMO deposit can earn staking rewards. 
A Candidate can resign, but the tokens will be locked for the next 30 days (1,296,000 blocks) after the resignation. 

- **Becoming a Masternode**: A Candidate becomes a Masternode when he/she belongs to top 150 most voted Candidates in each epoch. 
A Masternode can resign, but the tokens  will be locked for the next 30 days after the resignation.

- **Reward**: The reward a Masternode receives in each epoch is proportional to the number of signatures he/she  signs.

## Token Voting and Staking

-   **Token  voting**: Token holders can vote for Masternode Candidates by sending TOMO to each Candidate specific voting address using the official governance d-app. Top 150 most voted Candidates will become Masternodes. 
Token holders can un-vote a Candidate, but the tokens will be locked for the next 48 hours (86,400  blocks) after the un-voting.   

-   **Staking**: Masternode token  deposits, and all  tokens used to vote for Masternodes will enter staking program, and earn block rewards in each epoch, plus any fees. 
Tokens used to vote for Candidates who do not become Masternodes will not earn staking reward.

## Token Emission Schedule

-   **Following the fundraising commitment**: The total amount of tokens at the genesis block is 55 million TOMO tokens in circulation; 
12 millions are reserved for the team vested over the next 4 years; 
16 millions are reserved for strategic partners, and an ecosystem building fund which totals 83 millions tokens. 
Plus, 17 millions are reserved as block rewards for the next 8 years, the amount of tokens  in circulation at the end of the 8th year  after the genesis block is around 100 million TOMO. 
After the mainnet: the block reward for the first and second year is  4 million TOMO annually; the block reward for the 3rd, 4th, 5th year is 2 millions TOMO annually ; and the block reward for the 6th, 7th and 8th year is 1 million TOMO annually . 
Subsequently, the block reward will be halted, or activated at a number less than or equal to 1 million TOMO annually.


-   **Implementation**: Each epoch consists of 900 blocks, which will reward a total of 250 TOMO in the first two years. 
250 TOMO will be divided to all the Masternodes proportional to the number of signatures they sign during the epoch. 
Afterward, the reward achieved by each Masternode  will be divided into three portions. 
The first portion of 40% called “Infrastructure Reward” goes to the Masternode. 
The second portion of 50% called “Staking Reward” goes to the pool of all voters for that Masternode which is shared proportionally based on the token stake. 
The last portion of 10% called “Foundation Reward” goes to a special account controlled by the Masternode Foundation, which is run by TomoChain company initially. 

## Voting/Staking Consideration

### Candidate/Masternode incentives

Masternodes will receive a significant amount of block rewards, which likely exceeds the cost for running the infrastructure. 
However, Masternodes need to invest in TomoChain by depositing  at least 50K Tomo, and stake them for a long term. 
Furthermore, after depositing 50K TOMO to become a Candidate, if the account cannot become a Masternode (has less votes than Top  150 most voted  Candidates), he/she will receive no rewards. 
Therefore, Candidates have an incentive to do as much as they can such as signaling their capability to support TomoChain to get into top 150 most voted Candidates.

### Token voter incentives

Token voters should vote for Candidates who signal a strong support for TomoChain because if the Candidate does not become a Masternode, voters will not receive any rewards. 
However, token voters should also vote for the less voted Candidates because the most voted Candidates will receive less reward per token stake comparatively. 

## Long Term Platform Economics Consideration

### P/E theory of token value

Equity price can often be a multiple of annual earnings a company generates. In the case of a blockchain platform, earnings could be considered as the total rewards and fees that the platform produces. 
The multiples for technology startups in the early days could exceed 200 which is where Ethereum network is approximately at the moment.  

### Quantity theory of money for token value

In this theory, the total amount of TOMO can be considered the money supply for the blockchain economy including all the d-apps and tokens on top of TomoChain. 
Assuming a constant price, and velocity of money, demand for money will raise proportionally to the total amount of activities of the whole blockchain network, which will raise the price of TOMO if the supply of Tomo is fixed, or the inflation rate is very small. 
TomoChain’s advantages of minimal transaction fee, and very fast confirmation time could spur a massive amount of activities for Tomo tokens, and other tokens on top of TomoChain.    

### Store of value theory of token value

Blockchain native tokens can be considered as the means of fundraising, or the store of value within their own blockchain economy if the supply of the token is fixed, or the inflation rate is very small, and predictable. 
These conditions are applying to Ether and Bitcoin at the moment, and can be applying to TOMO token in the future as the Tomochain’s economy grows. 

### Built-in decentralized exchange
TomoChain roadmap includes a built-in decentralized exchange, in which a portion of fees will be added to the pool of epoch rewards. These fees could be substantial if there are many valuable tokens on top of TomoChain. 
This extra feature can increase the future earnings of the network, and raise TOMO price based on the P/E theory.

## Decentralized Governance

### Become a Masternode

Becoming a Masternode is an important signal of long-term support for TomoChain platform. 
We would welcome other entities to become a Masternode, to show their supports by helping the network, and gradually decentralize the platform governance.  

### Masternode Council

It is postulated that TomoChain platform would later be coordinated by non-profit body such as Masternode Council (or Foundation) amongst many other decentralized bodies which receive a steady amount of income from the network, and act solely in the interest of the network.

### Technical decision making

The technical decisions should be considered, debated, and decided upon by qualified experts based on the long-term interest of the network.

### Economic decision making

The economic decisions such as the amount of block rewards, inflation rate, the division of block rewards might be based on the consensus of majority of the Masternodes (with their voters). 
Masternode Council could be one of the coordinating bodies for these activities using the official governance d-app.

## Appendix A: History of the Project

TomoChain PTE. LTD. raised funds to build TomoChain blockchain platform in early 2018. 
The ICO whitepaper is at https://goo.gl/avtnZ1. 
The terms of sale and other documents can be found at  https://tomochain.com/exchanges TomoChain platform will be gradually decentralized in 2-8 years after the mainnet launch, and eventually become a secure public blockchain platform for everyone.

## Appendix B: Reward Calculation Formula and Details

### General notations

-   N: the current number of masternodes, maximum of N = 1..150
-   $M_1$, $M_2$, .., $M_N$: the set of masternodes in the current epoch
-   $C_1$, $C_2$, .., $C_N$: the number of signatures a masternode has made
-   $S_1$, $S_2$, .., $S_N$: the total amount of staked (including deposited and voted) TOMO for a masternode
-   $D_1$, $D_2$, .., $D_N$: the amount of deposited TOMO by a masternode
-   X: the total reward per epoch for all masternodes
-   Total reward per masternode = Infrastructure reward + staking reward
-   MN: stand for masternode

Reward divided to Masternode $M_i$: 			$R_i = \frac{C_i*X}{\sum_{i=1}^{N}C_i}$

Reward per epoch:   

-   Masternode infrastructure reward: 		0.4$R_i$

-   Voter with 1k voted TOMO: 				$\frac{0.5R_i*1000}{S_i}$

-   Masternode staking reward: 			$\frac{0.5R_i*D_i}{S_i}$

Reward per week (48 * 7 = 336 epochs):
	
-   Masternode infrastructure reward: 		336 * 0.4$R_i$

-   Voter with 1k voted TOMO: 				336 * $\frac{0.5R_i*1000}{S_i}$

-   Masternode staking reward: 			336 * $\frac{0.5R_i*D_i}{S_i}$

Reward per year (48 * 365 = 17520 epochs):

-   Masternode infrastructure: 				17520 * 0.4$R_i$

-   Voter with 1k voted TOMO:				17520 * $\frac{0.5R_i*1000}{S_i}$

-   Masternode staking reward: 			17520 * $\frac{0.5R_i*D_i}{S_i}$

-   Total reward for a masternode:		17520 * 0.4$R_i$ + 17520 * $\frac{0.5R_i*D_i}{S_i}$

### Applying the reward calculation formula to specific scenarios 

Note that, for simplification of illustration: 

-   The total amount of staked TOMO for all masternodes is equal 

-   The signatures for all masternodes in the scenarios are equal 

With these assumptions, all masternodes receive the same divided reward (R) and the same infrastructure reward. 
Furthermore, the reward for Voters with 1k voted TOMO is equal regardless of which the amount is voted for.

### Scenario 1: 50 Masternodes, 2.5 million token voting, a total of 5 million token locked.

N = 50, X = 250, $S_1 = S_2 = .. = S_{50} = 5 000 000 / 50 = 100k$ TOMO

$C_1 = C_2 = .. = C_{50}$

Therefore, $R_1 = R_2 = .. = R_{50} = R = X/50 = 5$ TOMO

#### Reward per epoch:

-   MN infrastructure reward = 0.4 * 5 = 2 TOMO

-   For Voter with 1k voted = (0.5 * 5 * 1000) / 100k = 0.025 TOMO

-   MN staking reward with 50k TOMO deposited: 50 * 0.025 = 1.25 TOMO

#### Reward per week: 
   
-   MN infrastructure reward = 336 * 2 = 672 TOMO
   
-   For Voter with 1k voted = 336 * 0.025 = 8.4 TOMO
   
-   MN staking reward with D = 50k TOMO deposited: 336 * 1.25 = 420 TOMO

#### Reward per year: 
   
-   MN infrastructure reward = 17520 * 2 = 35 040 TOMO

-   For Voter with 1k voted = 17520 * 0.025 = 438 TOMO

-   MN staking reward with 50k deposited: 17520 * 1.25 = 21900 TOMO

-   Total reward per MN with D = 50k deposited: 35 040 + 21 900 = 56940 TOMO

### Scenario 2: 100 Masternodes, 3 million token voting, a total of 8 million token locked.

N = 100, X = 250, $S_1 = S_2 = .. = S_{100} = 8 000 000 / 100 = 80k$ TOMO

$C_1 = C_2 = .. = C_{100}$

Therefore, $R_1 = R_2 = .. = R_{100} = R = X/100 = 2.5$ TOMO

#### Reward per epoch:
    
-   MN infrastructure reward = 0.4 * 2.5 = 1 TOMO

-   For Voter with 1k voted = (0.5 * 2.5 * 1000) / 80k = 0.015625

-   MN staking reward with D = 50k deposited: 50 * 0.015625 = 0.78125 TOMO

#### Reward per week: 
   
-   MN infrastructure reward = 336 * 1 = 336 TOMO
   
-   For Voter with 1k voted = 336 * 0.015625 = 5.25 TOMO
   
-   MN staking reward with D = 50k deposited: 336 * 0.78125 = 262.5 TOMO

#### Reward per year: 

-   MN infrastructure reward = 17520 * 1 = 17 520 TOMO

-   For Voter with 1k voted = 17520 * 0.015625 = 273.75 TOMO

-   MN staking reward with D = 50k deposited: 175 20 * 0.78125 = 13687.5 TOMO

-   Total reward per MN with D = 50k deposited: 17 520 + 13 687.5 = 31208 TOMO

### Scenario 3: 150 Masternodes, 12.5 million token voting, a total of 20 million token locked.

N = 150, X = 250, $S_1 = S_2 = .. = S_{150} = 20 000 000 / 150 = 133 333$ TOMO

$C_1 = C_2 = .. = C_{150}$

Therefore, $R_1 = R_2 = .. = R_{150} = R = X/150 = 1.6667$ TOMO

#### Reward per epoch:

-   MN infrastructure reward = 0.4 * 1.6667 = 0.6667 TOMO

-   For Voter with 1k voted = (0.5 * 1.6667 * 1000) / 133 333 = 0.00625 TOMO
    
-   MN staking reward with 50k deposited: 50 * 0.00625 = 0.3125 TOMO

#### Reward per week: 

-   MN infrastructure reward = 336 * 0.6667 = 224 TOMO

-   For Voter with 1k voted = 336 * 0.00625 = 2.1 TOMO
   
-   MN staking reward with D = 50k deposited: 336 * 0.3125 = 105 TOMO

#### Reward per year: 
   
-   MN infrastructure reward = 17520 * 0.6667 = 11 680 TOMO
   
-   For Voter with 1k voted = 17520 * 0.00625 = 109.5 TOMO
   
-   MN staking reward with D = 50k deposited: 175 20 * 0.3125 = 5475 TOMO
   
-   Total reward per MN with D = 50k deposited: 11 680 + 5475 = 17155 TOMO






