# Frequently Asked Questions

!!! Note
    This section is still in draft mode and could be subjective to changes.

## General

### Caelum

!!! quote "How does Caelum work? What is the architecture and consensus used?"
    Caelum relies on a system of 150 Masternodes with Proof of Stake Voting (POSV) consensus that can support low fees (appro. 1/100 of that of Ethereum's) and 2-second transaction confirmation times.
	Security, stability and chain finality are guaranteed via novel techniques such as Double Validation, staking via smart-contracts and true randomization processes.

!!! quote "Can you tell more about Proof of Stake Voting (PoSV)? What is it?"
    At the heart of Caelum, the Proof-of-Stake Voting (PoSV) consensus enables Caelum as an EVM-compatible and scalable public blockchain, on which every Ethereum smart contract can be effectively run with almost instant transaction confirmation.

	PoSV features its Masternode architecture in which token holders deposit 50k $CLMP to become a masternode candidate and receive votes from other token holders.
	The most voted masternode candidates are selected as masternodes for block creation within a period, called epoch.
	Each masternode takes its block creation in a round-robin manner every 2-second and follows the double validation technique for security reinforcement.
	A block is finalised if it is signed off by 3/4 masternodes.
	At the end of each epoch, the masternodes that have signed finalised blocks are rewarded.
	Stakers who voted for those masternodes will also be rewarded.

!!! quote "What is Double Validation?"
    Double Validation provides an additional trustless validation layer for security enhancement through a provable uniform distribution decentralized randomization.
	Specifically, when a block is created by a masternode, it must be verified by another masternode that is randomly selected among the set of masternodes before being added to the blockchain.
	Double validation strengthens Caelum’s security, reduces fork and nothing-at-stake attacks, and makes Caelum unique among other Proof-of-Stake-based blockchains.

!!! quote "What is an 'epoch'?"
    An epoch is a 900-block period of 2-second block time starting from block #1 (900 blocks x 2s/block = around 1800s or 30 minutes).

!!! quote "Which scaling solutions will Caelum implement? Will you have sharding?"
    Caelum solutions are based on on-chain scaling built into an architecture of 150 voted masternodes with our Proof-of-stake Voting (POSV) consensus protocol.
	We achieve 2-second block-time and almost instant transaction confirmation.

	To scale further our infrastructure, we have presented our [Sharding proposal](https://bit.ly/2xHK0u3) for uniquely integrating Sharding into our current architecture and consensus.
	The implementation of sharding is on-going and we will enable, after Caelum Digital inhertance solutions

	Besides sharding, we are actively researching scalability solutions like EVM parallelization and Plasma.
	New scaling techniques such as sharding, EVM parallelisation, private-chain generation, hardware integration will be evaluated before being integrated into Caelum's masternode architecture.

!!! quote "What is the current TPS? What is your targeted transaction speed and when do you think you can achieve that speed?"
    Caelum supports low transaction fees (appro. 1/100 of that of Ethereum's) and 2-second transaction confirmation times.
	The mainnet with POSV Masternodes delivers 2'000 transactions per second (TPS).
	Once sharding is implemented by Q2 2019, we expect 20'000-30'000 TPS.

	Caelum team is continuously researching other scaling techniques to keep improving.

!!! quote "What makes Caelum different?"
    The unique point of Caelum comes from technology, the products and the ecosystem.

	**Novel technology:** includes

	- Proof of Stake Voting consensus
	- Build in governance D-app
	- Double Validation and Randomization
	- Sharding based on a stable masternode artichitecture
  - IPFS storage integrations
  - Decentralized options to pass on digital assets

	This enables Caelum to achieve:

	- Cheap transactions: appro. 1/100 of that of Ethereum
	- 2000 TPS to handle a robust d-app and token ecosystem; TPS will be dramatically higher once our sharding solution is enabled (20k-30k TPS)
	- 2 second block time for fast transactions
	- EVM-compatibility allows for interoperability with Ethereum ecosystem.
  - First truly decentralized asset inhertance solutions

	**Our products**

	- CaelumScan: Shows all blocks, transactions, finality, smart contracts, D-Apps and token information
	- CaelumMaster: Allows users to apply for a Masternode Candidate position; to vote for Masternodes and shows Masternode performance statistics
	- CaelumVaults: Smart vaults designed for digital asset storage and inhertance solutions

	**Our own ecosystem**

	- Caelum also is working vigorously on building its ecosystem and has sealed many partnerships from all fields such as agriculture, robotics, gaming, IT solution providers, advertising, pharmaceutical tracking, education and research, payment, communication, name service, food traceability, tourism etc such as TechInAsia, Kambria, Axie Infinity, Vnext, Farmatrust, TE-Food, Triip Protocol, Portal Network...


!!! quote "Caelum is EVM-compatible. What does that mean?"
    EVM means Ethereum Virtual Machine.
	Caelum supports all EVM-compatible smart-contracts, protocols, and atomic cross-chain token transfers.
	This means that any smart-contract written in Ethereum protocol can be easily ported to Caelum.
	Any d-App written in Ethereum can be seamlessly ported to Caelum.

!!! quote "Is Caelum a side-chain of Ethereum?"
    Caelum has its own testnet blockchain currently and soon as mainnet.

!!! quote "Is Caelum compatible with Ethereum?"
    Yes, any smart-contract written in Ethereum protocol can be easily ported to Caelum.
	This is one strength appealing to some dApp developers and some of our partners.

!!! quote "Can developers make hybrid dApps using both Ethereum and Caelum in one single dApp?"
    Yes, they can make an app, and deploy it to both Ethereum, and Caelum.
	It can be done relatively easy since Caelum supports EVM, and share a common architecture with Ethereum.

!!! quote "When is Caelum mainnet launch?"
    Our mainnet launch is expected during Q3 2019

!!! quote "What is the difference between CLMP and Caelum?"
    CLMP is the native currency of the Caelum ecosystem.

!!! quote "How do you solve 'security problems' when using Caelum?"
    In terms of security of consensus protocol, Caelum proposes Double Validation and Randomization to protect the system.
	The details of these techniques can be referred in the [Tomochain Original Technical paper](https://caelumproject.com/docs/technical-whitepaper--1.0.pdf).

	Caelum solves some consensus-related security aspects:

	1. Nothing-at-stake problem: This problem is commonly discussed in PoS-based blockchain consensus and just like 51% attacks in PoW. Caelum solves it by using Double Validation and Randomization.
		The details are shown in our technical paper.
	2. Long-range attacks: Attackers can try to recreate all blocks from a very far position to the current block.
		Attackers can do that because PoS-based consensus does not require extra-ordinary hashing power to re-write the whole blockchain.
		Caelum addresses by providing finality.
		Once a block is signed by at least 3/4 masternodes, it is consider irreversible, meaning that any attempt to re-write the blockchain history will be rejected.
	3. Censorship-resistance: Please [refer to this Tomochain medium article](https://medium.com/tomochain/tomochain-vs-eos-io-the-battle-of-posv-vs-dpos-or-just-some-coincidence-of-design-philosophy-b5f606a1e5df) for more detailed analysis
	4. DDoS and spamming attacks: Caelum's transaction fee is not zero (even it is very low), attackers still require a significant amount of CLMP in order to flood the network for only a short time.


!!! quote "Where can I take a look at Caelum code? Is there a GitHub repository?"
    All the code regarding Caelum is free to consult on our [GitHub](https://github.com/caelumproject).
	This includes the code for the Caelum blockchain client, governance DApp, block explorer, tools, docker images, documentation, etc.

	However, other blockchain related projects like ReplyBlock or drafts, work-in-progress and not yet disclosed projects are usually kept in private repositories.

	We like to publish code publicly when it reaches a certain level of development and/or when we think auditing and contributions are beneficial to the codebase.
	Keeping early projects private is probably more responsible for now due to our scale.
	It might change in the future.

	We are also working with some third parties with which we signed a non-disclosure-agreements for code development.

!!! quote "Where can I contact you to get support?"
    If you need support, please contact us on one of these platforms:

    - Technical talk and support running our softwares: [https://t.me/caelumofficial](https://t.me/caelumofficial)
    - Bugs or technical contributions: [GitHub (https://github.com/caelumproject)](https://github.com/caelumproject)
    - General quotes regarding our blockchain: [https://t.me/caelumofficial](https://t.me/caelumofficial)

!!! quote "Which are Caelum's official channels for communication and information?"
    You can keep in touch with our latest news here:

	1. Twitter: [https://twitter.com/CaelumANN](https://twitter.com/caelumtoken)
	2. Telegram Announcements: [https://t.me/caelumofficial](https://t.me/caelumofficial)
	4. Website: [https://caelumproject.com](https://caelumproject.com)
	5. Medium: [https://medium.com/caelumproject](https://medium.com/caelumproject)

### Ecosystem

!!! quote "What incentives have partners and dApp developers to build on Caelum?"
    Caelum supports all EVM-compatible smart-contracts, protocols, and atomic cross-chain token transfers.
	This means that any smart-contract written in Ethereum protocol can be easily ported to Caelum.

	Any d-App written in Ethereum can be seamlessly ported to Caelum, instantly enjoying all Caelum advantages: almost zero-transaction fee; 2-second confirmation time; 2'000 TPS and soon 20K-30K TPS once sharding is enabled.

	D-app developers also have dedicated technical support from Caelum developers.

	Besides the technical aspects, our partners will also benefit from the Caelum community support and fundraising opportunities, thanks to Caelum very good relationships with well-known investors.

!!! quote "Why should developers build dApps on Caelum?"
    See: [https://www.youtube.com/watch?v=8J4h2zsd_UE](https://www.youtube.com/watch?v=8J4h2zsd_UE)

!!! quote "Where can I check the actual products, ecosystem?"

	If you want to access it directly, you can find the links to our different products deployed in Testnet on our [Networks page](https://docs.caelumproject.com/general/networks/).

	The list of Caelum Products is as follows: CaelumScan, CaelumStats, CaelumMaster.

### CLMP - Economics

!!! quote "What is CLMP? Can you describe the functions and purposes of CLMP?"
    CLMP is the native cryptocurrency of Caelum and will be the reserve cryptocurrency for all third-party apps running on Caelum.
	Being the protocol token for the Caelum infrastructure, CLMP will be needed by all parties utilising Caelum to build apps or issue and integrate cryptographic tokens into their apps.

	The supply of CLMP is fixed, long-term and non-inflationary.

	In addition to the above, CLMP is an integral part of the Caelum network for a number of reasons.

	- CLMP will be used to fund the development of Caelum and its ecosystem (CaelumScan, CaelumMaster, etc.).
	- CLMP will be used as a reward to incentivise the building of the Caelum engine/ecosystem.
	- CLMP will be used as a long-term, decentralized governance instrument of the Caelum network.

	You can check our [technical whitepaper](https://docs.caelumproject.com/wp-and-research/technical-whitepaper/) for more details.

!!! quote "Can I mine CLMP?"
    CLMP is not `mineable` but `mintable` by masternodes.
	Masternodes are responsible for creating, verifying and finalizing the blocks created within a period, called epoch.
	Masternodes and Stakers will receive block rewards.

!!! quote "What is CLMP circulating supply and total supply?"
    The initial circulating supply at genesis block is 55'000'000 but the current circulating supply is increasing every epoch.

	After 8 years, CLMP total supply is fixed at 100'000'000 CLMP.

!!! quote "How is CLMP distributed?"
    The token allocation is splitted as follows:

	- 55 millions CLMP was already allocated after the token sale period;
	- 12 millions CLMP are reserved for the team vested over the next 4 years;
	- 16 millions CLMP are reserved for strategic partners and an ecosystem building fund;
	- 17 millions CLMP are reserved as block rewards for the next 8 years

!!! quote "How are block rewards distributed?"
    17 millions CLMP are reserved as block rewards for the next 8 years.

	- 1st and 2nd year: 4 million CLMP annually
	- 3rd, 4th and 5th year: 2 million CLMP annually
	- 6th, 7th and 8th year: 1 million CLMP annually

!!! quote "Will Caelum have inflation?"
    The total supply is fixed at 100 million CLMP in the first 8 years (non-inflationary).
	17 million CLMP which are reserved as block rewards will have been all distributed after 8 years.
	At that time, we are expecting that block rewards will come from the exchange fees.
	But the Masternode Council can decide to increase the total supply by 0.5-1 million CLMP per year (which will be used as block rewards) (~small inflation, 0.5%-1% annually).

!!! quote "How often are block rewards paid out?"
    Block rewards will be earnt every epoch, which lasts for 900 of two-second-block time (~30 minutes).
	Stakers will be also rewarded.

!!! quote "If Caelum has zero fees, how can Masternodes get rewards?"
    The block rewards will be emitted from a reserved fund with 17 million CLMP for the first 8 years.
	The block rewards are as follows:

	- 1st and 2nd year: 4 million CLMP annually
	- 3rd, 4th and 5th year: 2 million CLMP annually
	- 6th, 7th and 8th year: 1 million CLMP annually

	We plan to have a built-in DEX, the revenues from the DEX will go to the Masternodes as well.

	After 8 years, the block rewards will come from the exchange fees.
	Also, the Masternode Council can decide to increase the total supply by 0.5-1 million CLMP per year (which will be used as block rewards).

!!! quote "What is the price in presale and ICO?"
    Presale Price: `$0.2`

	ICO Price: `$0.25` (`0.0003125 ETH`)

!!! quote "When will CLMP be listed on new exchanges?"
    We do not discuss about exchange related questions due to the regulation.
	We will announce every exchange news on our official channels on due time.

!!! quote "Is CLMP an ERC-20 token?"
    Since Mainnet, CLMP has become the native coin of the Caelum blockchain.

!!! quote "What is a TRC-20 token?"
	A TRC-20 token is a token which can be issued on the Caelum blockchain.
	TCR-20 is similar to the ERC-20 standard in the Ethereum  blockchain.

!!! quote "Where to store CLMP? How can I send CLMP to my wallet?"
    You can store CLMP in TrustWallet, MetaMask, MyEtherWallet.

!!! quote "How to connect Metamask / MyEtherWallet with Caelum mainnet?"

    The followings are information used for configuring Metamask to connect to Caelum Mainnet.

    - RPC endpoint: `https://rpc.caelumproject.com`
	- Chain ID: `88`
	- Symbol: `CLMP`
	- Network Name: `Caelum Mainnet`

    Caelum is now supported by MyEtherWallet.
    All you need to do is to choose `Network CLMP` in the supported network list in MyEtherWallet.

	You can find the info about our Mainnet or Testnet on our [Networks](https://docs.caelumproject.com/general/networks/) page.

	Also, you can find out more detailed information about how to use different wallet types to connect to Caelum on [Connect your wallet](https://docs.caelumproject.com/get-started/wallet/)

!!! quote "Where can I buy CLMP? (exchanges)"
    Currently our network is in Testnet modus and no exchanges are availebl. Please check [our public presale](https://presale.caelumproject.com) if you want to be part of caelum upon mainnet launch

### Masternodes

!!! quote "Does Caelum have Masternodes? How do they work?"
    Yes, Caelum has a maximum of 150 Masternodes with Proof of Stake Voting (POSV) consensus for low transaction fee, and instant transaction confirmation.
	Masternodes create, verify and validate new blocks in Caelum’s platform.

	- **Masternode Candidates:** Any account can deposit 50,000 CLMP using [CaelumMaster](https://master.caelumproject.com/) to become a masternode candidate.
	A candidate can resign, but the tokens will be locked for the next 30 days (1,296,000 blocks) after the resignation.
	- **Becoming a Masternode:** A candidate becomes a masternode when he/she belongs to the top 150 most voted candidates in each epoch.
	A Masternode can resign, but the tokens will be locked for the next 30 days after the resignation.
	- **Rewards:** The rewards a masternode receives in each epoch is proportional to the number of signatures it signs.
	Masternodes will also receive fees from the Caelum DEX, which is planned for development in Q1 2019.

	Caelum masternodes started signing blocks and receiving block rewards with the Mainnet release in December 14th, 2018.

!!! quote "What is a masternode in the Caelum ecosystem?"
    A Caelum masternode is a server which uses its computing power to contribute to the network.
	Its job is to create and sign blocks.
	For this contribution to the network, masternodes receive rewards in the form of CLMP.

	Masternodes are elected using the PoSV consensus via our governance dApp [CaelumMaster](https://master.caelumproject.com/)

!!! quote "What are the incentives to run a masternode?"
    Masternodes contribute to the network and for this work they will receive a significant amount of block rewards, which will likely exceed the cost for running the infrastructure.
	However, masternode owners need to invest in Caelum by depositing at least 50'000 CLMP, and stake them in the long term.

	After the initial deposit, if the account does not become a masternode (has less votes than the top 150 most voted candidates), he will not receive rewards.
	Therefore, candidates are incentivised to do as much as they can to signal their capability to support Caelum to get into top 150 most voted candidates.

!!! quote "How did you decide on 150 masternodes? Why did you decide to increase this from the initial 99?"
    The reason came from both decentralization consideration, and also scalability consideration.
	In terms of decentralization, 150 is better than 99.
	The more important consideration is the scalability.
	We also increased the number of masternodes to better suit the sharding solution later.

	Also 150 is [Dunbar’s Number](https://en.wikipedia.org/wiki/Dunbar%27s_number).

!!! quote "Where will the Masternode rewards come from? Will they be from the DEX?"
    The block rewards will come from a 17 million CLMP reserve for the next 8 years - this was decided since the genesis block.
	Our [Economics paper](https://docs.caelumproject.com/wp-and-research/economics-paper/) lays out the number in detail.

	And then later on, because we plan to have a built-in DEX, the revenues from the DEX will go to the Masternodes as well.

!!! quote "When are Masternode rewards paid out?"
    Masternode operators and stakers will receive rewards every epoch.
	An epoch is a 900-block period of 2-second block time (~30 minutes).

!!! quote "How much rewards will Masternodes receive?"
    Each epoch consists of 900 blocks, which will reward a total of 250 CLMP in the first two years.
	This amount of 250 CLMP will be divided to all of the Masternodes proportionally to the number of signatures they sign during the epoch.

	Example: With only 25 Masternodes and equal performances, every masternode would be rewarded with 10 CLMP. With 125 Masternodes, each one would receive 2 CLMP per epoch.

	Please, refer to our [Economics paper](https://docs.caelumproject.com/wp-and-research/economics-paper/) for more details about the masternodes reward.

!!! quote "How much reward from Masternodes will go to the Masternode infrastructure (node owner) and how much is for voters?"
    There is a reward sharing ratio among token holders and masternode who has been elected supported by the token holders.
	The reward achieved by each Masternode will be divided into three portions:

	- **Infrastructure Reward:** The first portion of 40% called Infrastructure Reward goes to the Masternode operator.
	- **Staking Reward:** The second portion of 50% called Staking Reward goes to the pool of all voters for that Masternode which is shared proportionally based on the token stake.
	The Masternode also gets proportional rewards for his 50K CLMP initial deposit.
	- **Foundation Reward:** The last portion of 10% called Foundation Reward goes to a special account controlled by the Masternode Foundation, which is run by the Caelum company initially.

!!! quote "What is the expected ROI for Masternodes and Stakers?"
    The rewards for every masternode will be dynamic and depending on multiple factors like: number of masternodes in the network, the efficiency signing blocks, the total number of votes on each masternode.
	The most efficient masternodes signing blocks will receive higher rewards.

	Please, refer to our [Economics paper](https://docs.caelumproject.com/wp-and-research/economics-paper/) for more details about the masternodes reward.
	We discuss 3 possible scenarios with 50, 100 and 150 Masternodes; and different number of total votes.

	One example is outlined below.

	Scenario: 150 Masternodes, 12.5 million tokens voting (a total of 20 million token locked).

	Reward achieved per epoch (900 blocks):

	- `By a Masternode = 0.6667 CLMP`
	- `By a Voter with 1K CLMP staked = 0.00625 CLMP`

	Approximate reward achieved per week:

	- `By a Masternode = 224 CLMP`
	- `By a Voter with 1K CLMP staked = 2.1 CLMP`

	Approximate reward achieved per year:

	- `By a Masternode = 11,680 CLMP`
	- `By a Voter with 1K CLMP staked = 109.5 CLMP (10.95% annually)`
	- `Total reward for a Masternode with a 50K CLMP deposit: 17,155 CLMP (34.31% annually)`

### Masternode Candidate

!!! quote "What is a masternode candidate? What is the difference between masternode candidate and masternode?"
    A Masternode Candidate is any node who deposited 50K CLMP and is listed on [CaelumMaster](https://master.caelumproject.com/).

	One Candidate only becomes a Masternode when he is in the top-150 most-voted masternode candidates in an epoch.
	Only these elected masternodes will be able to sign blocks and receive block rewards.

!!! quote "How can I become a Masternode?"
    The first step to become a masternode, is becoming a masternode candidate.
	To become a Masternode Candidate you need:

	- to run Caelum software in a machine with certain minimal hardware requirements
	- to deposit 50’000 CLMP in a smart-contract via CaelumMaster

	The list of Masternode Candidates will be available on the governance DApp, [CaelumMaster](https://master.caelumproject.com/).
	The next step is to be elected as one of the top 150 most voted candidates.

!!! quote "Do I need to use my own computer to run a node?"
    We recommend using an IaaS ("cloud") provider of your choice (like Amazon AWS, Digital Ocean, Google Cloud GCE, Vultr, etc).
	The machine must be directly facing internet (public IP, no NAT) and with 100% uptime.

	If you have other production grade environment than cloud provider at your disposal, please tell us more about on our [https://t.me/caelumofficial](https://t.me/caelumofficial).

!!! quote "Which are the hardware requirements to run a node?"
    Processing transactions is mostly CPU bound.
	Therefore we recommend running CPU optimized servers.

	- Directly facing internet (public IP, no NAT)
	- 16 cores CPU
	- 32GB of RAM
	- SSD storage

	We recommend using popular cloud providers as their reliability and uptime are close to 100%.
	Those servers would be a good starting point:

	- **DigitalOcean:** CPU optimized droplet 32GB/16CPU
	- **Amazon EC2:** C5 instance
	- **Google Cloud Engine:** n1-highcpu-16

	Setting up a masternode candidate on a weaker machine might result in poor performances, significantly impacting owner's rewards and the chain performance.

	**Note:** If you are running a node in Testnet, 2CPU/8GB of RAM is sufficient.

!!! quote "How do Masternode Candidates become Masternodes?"
    Once you are a Masternode Candidate, you need the support of Caelum community in the form of votes.
	The top 150 most voted candidates every period called epoch (900 blocks of 2-second block-time) will be promoted to Masternode.
	This list will change dynamically every epoch.
	Only the 150 masternodes elected will be able to sign blocks and will receive rewards in the form of CLMP.

!!! quote "Do I need two wallets to run a Masternode?"
    It is recommended for security reasons.
	You can create your wallet from wherever you want, the only rule being that you need two of them.
	One for your masternode, and one to make the 50K deposit (this account will receive the rewards).

!!! quote "What is the 'coinbase address'?"
    'Coinbase address' is the public address used to run your node and register it to the system.

	We recommend using two addresses when running your nodes.
	The public address or 'coinbase address' will only receive transaction fees.
	The private address is from where you make the initial 50K CLMP deposit and where the block rewards will be collected.


!!! quote "I noticed that we need another wallet for masternode with a different mnemonic. Assume we use a hardware wallet, we would need another hardware wallet with different mnemonic?"
    It is recommended to use a separate empty account for your masternode as it only receive transactions fees - what we call public or 'coinbase address' on the documentation.

	The block rewards are sent to the account connected to CaelumMaster who make the initial deposit - the 'private' address.

!!! quote "Can I use the same address pair (tmn public address + initial deposit address) for all my nodes? Or I have to transfer tokens to another wallet and start the second node?"
    No.
	Must use different public 'coinbase' addresses.
	But you can use the same initial deposit ('private') address, then all rewards will be transferred to only one address.

!!! quote "I have finished all steps of setting up node. Why I don't see my node on CaelumMaster?"
    You must apply to become a masternode candidate.

!!! quote "Do I need to deposit the 50K CLMP before or after running 'tmn' in VPS?"
    After. Your node must be fully synched before applying.

!!! quote "How do I check the blockchain sync status from the node?"
    You can watch the logs, but it is easier from the CaelumStats website or its eth.blockNumber API call.

!!! quote "If the masternode owner deposits 60K CLMP instead of 50K on its own node, can it later on unstake the excess 10K?"
    Yes, it can.

!!! quote "How can I change my node's name?"
    You can do it on CaelumMaster.
	Go to your masternode page on CaelumMaster, if you are logged in CaelumMaster with the owner account, you can click next to the masternode name to edit infos.

!!! quote "My node status is 'Proposed', will it change status with next checkpoint?"
    Yes, if you are in top-150 most voted.

!!! quote "Why is a node flagged as 'Slashed'?"
    A masternode will be automatically slashed by the Slashing Mechanism if the node doesn't validate any block within an epoch.

	Some reasons for this might be that the masternode does not have the correct Caelum software, lack of memory or masternode crashes due to the lack of e-maintenance and operation by the masternode owner.

	A Slashed node will be 'kicked out' for the next 4 epochs.
	At the 5th epoch after being slashed, the slashed masternode can go back to the candidate list.

!!! quote "How many nodes I am allowed to run?"
    As many as you can.

!!! quote "How can I resign as Masternode?"
    If you no longer want to be a masternode, you can resign on CaelumMaster.
	Your masternode will stop generating rewards and your funds will be locked for 30 days (1 296 000 blocks).
	After the lockup period you will be able to withdraw your 50’000 CLMP deposit.

!!! quote "Can I close the node entirely, then start a new one with a totally separate coinbase address without being penalized?"
    No.
	Your old node will be penalized (50K initial deposit 30-days lockup) and your new node has to apply again.

!!! quote "Is it possible to move a masternode later, like backup and start it from another IP address?"
    Yes.

!!! quote "What if I do not have enough CLMP for a masternode? Can I stake my coins?"
    Yes.
	Token holders can stake CLMP and receive rewards.

	To stake CLMP you need to vote for masternode candidates by sending CLMP to each candidates specific voting-address using the official governance d-App: CaelumMaster.`
	The top-150 most voted candidates will become masternodes.
	Token holders can also un-vote candidates, but the tokens will be locked for the next 48 hours (8,640 blocks) after the un-voting.

	Masternode token deposits, and all tokens used to vote for masternodes will enter the staking program, and earn block rewards in each epoch, plus any fees.
	Tokens used to vote for candidates who do not become masternodes will not earn staking rewards.

### Voter

!!! quote "What are the voters incentives? Do voters get rewards too?"
    Token voters should vote for the candidates who demonstrate strong support to the Caelum ecosystem.
	If strong candidates are voted to become masternodes, the network will be more powerful and the voters will earn more rewards.

	More information on the voting and reward mechanism in the [Economics paper](https://docs.google.com/document/d/197Cu57A6OYPoEQbrUVr067qNVEzP_FEwaDCFff7hnlM).

!!! quote "Can you stake CLMP?"
    Yes, you can stake CLMP and receive more CLMP coins as reward.

!!! quote "How do I Stake? Just holding on my wallet?"
    To stake in Caelum you must participate in the Caelum Masternode Election, voting for masternode candidate(s) using CaelumMaster to deposit your tokens in a voting smart-contract.

	Login to CaelumMaster and click 'Vote' on a node.

!!! quote "How does Caelum Masternode Election work (POSV)?"
    All token holders can vote CLMP on any candidates via [CaelumMaster](https://master.caelumproject.com/), where they can find a list of all masternode candidates.
	To vote, they must deposit CLMP in a smart-contract associated with the voted candidate.

	The top-150 most-voted candidates will be promoted to masternode during the next epoch and will be able to sign blocks and collect rewards.
	All the voters (stakers) who supported the elected masternodes will receive rewards proportional to the amount of CLMP voted.

!!! quote "How do I vote?"
    Any token holder can vote.
	Login to CaelumMaster and then click 'Vote' on a node.
	Then enter the amount of CLMP you want to vote (minimum is 100 CLMP).
	You vote by depositing (staking) tokens to a smart-contract associated with a masternode candidate.

	There are many ways to vote in CaelumMaster:

	- Voting via MetaMask (can be connected to your hardware wallets).
	- Voting from TrustWallet
	- Voting with your wallet's Private Key or MNEMONIC.


!!! quote "How do I vote from my Ledger Nano S?"
    Plug in your Ledger and open the Ethereum App. Go to CaelumMaster.

	Login in the top-right corner and select Ledger from the drop-down menu.

	Change the HD path to `m/44'/60'/0'`

	You should see your CLMP balance.

	To see a list of nodes click on the CaelumMaster homepage button - top left corner.
	Next to each node should be a 'Vote' button.
	When voting you will need to confirm transaction on your Ledger.

!!! quote "Can I stake for multiple masternodes via Ledger?"
    Yes, you can.

!!! quote "Can I use Trezor to vote for masternodes?"
    CaelumMaster doesn't directly support Trezor yet.
	So it depends on Metamask.

!!! quote "Can I connect Trezor to Metamask; after that unlock CaelumMaster with Metamask?"
    This is not supported yet.

!!! quote "What criteria must be considered when voting? Which masternode candidate should I vote for?"
    The most important criteria to maximize voter’s profit, the main points you should consider when voting, are the following:

	- **Top-150 most voted:** Your candidate must be one of the top-150 most-voted. If your candidate gets in the 151th most-voted place, it will not be promoted to masternode and you will earn zero rewards.
	- **Hardware, Performance:** Powerful CPU, RAM, bandwidth, latency, etc so the node can work hard and receive high rewards
	- **Number of signed blocks:** The more signed blocks per epoch, the higher rewards
	- **Time of last signed block:** Verify that the masternode is active
	- **Total Capacity:** Staking rewards are shared between all the masternode votes. Less voted masternodes are more profitable. 5K staked on a 50K-staked masternode will receive ten times more rewards than 5K staked on a 500K total staked masternode.
	- **Social Proof, Reputation:** Masternodes managed by trusted companies that are for the long term, maintaining the masternode, updating hardware and software to last versions, fixing problems, etc.

!!! quote "How many Masternode Candidates can I vote for?"
    You can vote for as many candidates as you wish, splitting your CLMP.

	Example: If you have 1'000 CLMP you can vote 500 CLMP for candidate A, 450 CLMP for candidate B, and 50 CLMP for candidate C.

!!! quote "What is the minimum amount to Stake?"
    The minimum amount to stake is 10 CLMP.

!!! quote "Which hardware-wallet can I use to vote?"
    You are able to use hardware wallets (Ledger, Trezor) with MyEtherWallet or Metamask.
	You can also directly connect to the Caelum Mainnet with Ledger and vote on [CaelumMaster](https://master.caelumproject.com/).

!!! quote "Is it possible to re-invest the CLMP earned and use it to continue voting?"
    Yes.

!!! quote "Is there a way to stake the earned rewards automatically?"
    This is not supported currently.

!!! quote "What happens if the Masternode I voted for stops working? Will I get my CLMP back?"
    Yes. You can unvote that masternode and take your tokens back after 48h lock-up period.

!!! quote "How do I UnVote?"
    If you do not want to support a masternode you voted for, you can unvote it by clicking the ‘Unvote’ button on the masternode's page and enter the amount of CLMP you wish to unvote.

	After unvoting, your CLMP are still locked in the smart contract for 48 hours (96 epochs) before you are able to withdraw.
	When the lockup period is finished you need to click the ‘Withdraw’ button and the coins will appear again on your wallet.

!!! quote "How to withdraw after unvoting?"
    After unvoting, you need to wait until your CLMP is unlocked from the smart contract (96 epochs or 48 hours).
	Then you can go to CaelumMaster and click the 'Withdraw' button in your account page (the three vertical dots on the top-right) and choose which withdrawal you want to receive back your CLMP.

	Note that you might see multiple withdrawals on your account page if you made multiple unvotes previously.

## Products

### CaelumScan

!!! quote "What is CaelumScan?"
    [CaelumScan](https://scan.caelumproject.com/) is our block explorer. It is pretty similar to EtherScan if you are already familiar with it.

	CaelumScan provides a user friendly, details and perfection-oriented user interface for Caelum block explorer.
	From a user perspective, CaelumScan brings Caelum’s transparency to users, because all block, transaction, finality, smart contracts, dApp and token information are read from Caelum and shown to users.
	Furthermore, CaelumScan also offers technical visualisations and does useful statistics about the Caelum performance, token holders and other functionalities.

!!! quote "What is a TxHash? How to check a TxHash?"
    TxHash stands for 'transaction hash', and is also known as a transaction ID.

	An example of what a TxHash looks like: `0x838d33119b33e4519cb201e49bfc570ddc0fbdc6d9cf7038d8254a4de97f7112`

	To check a TxHash, follow the steps below:

	On [CaelumScan](https://scan.caelumproject.com/), go to the search bar with the magnifying glass icon.
	Paste your transaction hash (TxHash) in the search bar and click the icon or press ENTER.
	Your transaction details will show up.

	Example: [https://scan.testnet.caelumproject.com/txs/0x838d33119b33e4519cb201e49bfc570ddc0fbdc6d9cf7038d8254a4de97f7112](https://scan.testnet.caelumproject.com/txs/0x838d33119b33e4519cb201e49bfc570ddc0fbdc6d9cf7038d8254a4de97f7112)

### CaelumStats

!!! quote "What is CaelumStats?"
    CaelumStats shows the various metrics regarding the current mainnet including the current number of masternodes, masternodes performance, current TPS, block-time, confirmation time, finality and other useful metrics.

!!! quote "How much is the average time to see my node appear on CaelumStats?"
    It should be less than a minute after tmn command is executed and finished.

!!! quote "Stats page wasn't working and showed a 70-second block. What happened?"
    The stats page is javascript code running in your browser.
	If your computer loses internet connection or the page is not active anymore for some reasons, the time will increase forever.
	In this case just refresh the page.

### CaelumMaster

!!! quote "What is CaelumMaster?"
    [CaelumMaster](https://master.caelumproject.com/), the 'Governance dApp', provides a professional UI that allows to see the list of masternodes and candidates, to deposit 50k CLMP to become a masternode candidate, to vote for masternodes, and to show masternode performance statistics.

!!! quote "How do I login on CaelumMaster?"
    Go to CaelumMaster.
	On the top-right corner click 'Login'.
	Then select how do you want to login: with Metamask, TrustWallet or Private Key/Mnemonic.

!!! quote "What is the 'capacity' of a Candidate/Masternode?"
    The capacity of a candidate is the 50K CLMP initial deposit plus the total amount of CLMP voted for that candidate.

!!! quote "Which of these numbers on CaelumMaster will tell us which is a good performing node vs poorly performing?"
    On CaelumMaster, click on a candidate to open the candidate page.
	Scroll down to 'Masternode Rewards'.
	You should look at 'Sign number' under Masternode Rewards to determine a good node or not.

	1 epoch has 900 blocks, a good masternode will verify all blocks in that epoch, meaning that the masternode will create around 900 sign transactions.
	We also calculate the reward based on sign transactions number.


!!! quote "What is a 'checkpoint'?"
    For each iteration of 900 blocks (called epoch), a checkpoint block is created, which implements only reward works.
	The masternode, who takes turn in the circular and sequential order to create blocks, has to scan all of the created blocks in the epoch and count number of signatures.

	It is worth noting that token holders who unvote before the checkpoint block will not receive any shared reward in the Staking Reward portion.

!!! quote "I want to stop running my node."
    If you don't want to run your masternode anymore, please remember to resign before shutting down the node.
