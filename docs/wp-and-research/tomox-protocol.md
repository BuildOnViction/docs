# TomoX: TomoChain Proposal for a Relayer-Masternode Decentralized Exchange Protocol

*Preliminary draft, comments are welcomed*</br>
*Long Vuong at long@tomochain.com*


## PREFACE

### TomoChain’s Vision and Mission

Our mission is to be a leading force in building the Internet of Value and its infrastructure. We are working to create an alternative, scalable financial system which is more secure, transparent, efficient, inclusive and equitable for everyone.
TomoChain relies on a system of 150 Masternodes with Proof of Stake Voting (PoSV) consensus that can support near-zero fees and 2-second transaction confirmation times. Security, stability and chain finality are guaranteed via novel techniques such as double validation, staking via smart-contracts and "true" randomization processes. 
TomoChain supports all EVM-compatible smart-contracts, protocols, and atomic cross-chain token transfers. New scaling techniques such as sharding, EVM parallelisation, private-chain generation, hardware integration will be continuously researched and incorporated into TomoChain's Masternode architecture which will be an ideal scalable smart-contract public blockchain for decentralized apps, token issuances and token integrations for small and big businesses.

### Scope

This document describes TomoChain’s initial design draft for TomoX - a secure and efficient relayer-masternode decentralized exchange protocol based on the TomoChain blockchain infrastructure. 

## INTRODUCTION 

Cryptocurrency exchanges have become an indispensable part of cryptocurrency and blockchain ecosystems, especially since the rise of major cryptocurrencies such as BTC and ETH and the increasing adoption of decentralized applications (DApps). Cryptocurrency exchanges provide liquidity solutions for users to exchange their cryptocurrencies for other cryptocurrencies, which eventually allows them to access any decentralized applications. In general, cryptocurrency exchanges can be classified as centralized exchanges (CEX) or decentralized exchanges (DEX). 
Early blockchain-based developed cryptocurrencies such as Bitcoin and Dash have become mainstream thanks to the help and the wide usage of centralized exchanges such as Coinbase, Bitfinex and Binance. The advantages of these exchanges are their user friendly interface and high performance that allow users to instantly transact/exchange cryptocurrencies with anyone on the exchange. Furthermore, because of high trade volumes and liquidity of centralized exchanges, to this point they have attracted more users than decentralized exchanges.
With the wider use of CEXs, their security and safety have become an increasingly hot topic of discussion. It is worth highlighting that some of the largest hacks in the history of cryptocurrencies have been through centralized exchanges such as MtGox and Bitfinex - where  850,000 BTC in 2014 and 120,000 BTC in 2016, respectively, were stolen. In short, there has been a tremendous amount of money stolen from CEXs. One of the reasons for these hacks has been centralized exchanges failing to protect the private keys of wallets that users had deposited their cryptocurrency into. Once a user deposits their cryptocurrency into a centralized exchange wallet, the user no longer has control of the wallet and must put their trust in this third party. However, this trust model seems to directly contradict blockchain’s ideology of eliminating the middleman. 
At TomoChain, our vision is that decentralized exchanges (DEXs) will be the future of cryptocurrency exchanges. DEXs allow users to control their assets while transacting, thus making them significantly safer and more secure than CEXs. The majority of currently deployed DEXs are based on Ethereum smart contracts and are mostly used for trading between Ethereum and ERC20-based standard tokens. The most widely used DEX based on Ethereum is IDEX, where most ERC20 issued tokens can be traded. 
At TomoChain, with our current masternode architecture and ideology of the token economy, our decentralized exchange will become a very important part of TomoChain’s ecosystem and TomoChain’s masternode-based economy.
In this paper, we describe the TomoX Protocol - TomoChain’s proposal for a secure and efficient relayer-masternode decentralized cryptocurrency exchange protocol. Compared to the current state of the art DEX architecture, TomoX Protocol has the following unique features: 
Blockchain core layer-integrated DEX: All current Ethereum-based DEXs are layer 2 solutions which rely on smart contracts with their matching engine combined with either off-chain or on-chain settlement. In contrast, TomoX will be integrated into the core blockchain layer where the high performance and fast confirmation time properties of our Proof-of-Stake Voting (PoSV) consensus will be beneficial.     
Decentralized order book based on Tomo Swarm: Currently, most decentralized exchanges store their order book in a centralized server where the matching engine scans over the orders. In contrast, TomoX relies on a decentralized storage network for storing the order book. The masternodes will provide infrastructure and computation for order matching and execution.
Relayer-masternode architecture: Building a decentralized exchange and providing traders with a significant liquidity pool are difficult and expensive tasks. In addition, an exchange trading thousands of tokens can be a source of confusion for traders with the potential to lose focus in some tokens of interest. TomoX has therefore been built to solve these issues by providing a relayer-masternode architecture. Relayers will have the responsibility of increasing trading liquidity on their exchanges for specific tokens.

## TOMOX: TOMOCHAIN DECENTRALIZED EXCHANGE PROTOCOL

The uniqueness of TomoX Protocol stems from the way it is integrated into TomoChain’s masternode architecture. In addition to executing and verifying transactions from users, masternodes will also execute the functionalities of TomoX. The following figure shows how the TomoX Protocol integrates the transaction processor into the current masternode architecture.

### Overview of TomoX’s usage flow

A user makes an exchange order through TomoDEX Web (part of TomoDEX relayer detailed later). The order-related data is then serialized and sent to Tomo Swarm, a decentralized storage system. Tomo Swarm subsequently broadcasts the order to all masternodes in the system. After the serialized order data is received and read from Tomo Swarm, it is deserialized and stored in a structured way in a decentralized order book. 
A matching engine then matches buy and sell orders to be executed, and the order processor then executes the matched orders. For each matched order pair, the order processor directly changes the TOMO/token balance of the corresponding buyer and seller. This change will then be synchronized with all other masternodes through PoSV consensus. Afterwards, a settlement transaction is created and sent to a settlement smart contract that is deployed on TomoChain. 
Each masternode takes turns executing matched orders based on the PoSV consensus: the masternode which is selected to create a block in a slot is responsible for executing the decentralized exchange functionalities within that slot. 

User transactions coming in to the mempool (transaction pool) of a masternode are processed by its transaction processor. The processed transactions together with the settlement transaction are then included in a newly created block. This new block is then broadcast to all masternodes in the network to reach a consensus following PoSV. 
The hashes of the matched orders are then pushed back to Tomo Swarm so that the history of order matching and trade execution can be traced back. 

### TomoDEX Web

TomoX Web provides an efficient and optimal user interface for users accessing the exchange. Importantly, users do not need to deposit any tokens to a centralized server, thus maintaining total control over their assets. As in any existing exchange, there are two types of actors:
Maker: A market maker is someone who provides liquidity to the market by placing limit orders on the order book. Without limit orders sitting on the books, the price of cryptocurrencies would swing around wildly as exchanges try to match buy and sell orders. 
Taker: A taker is someone who takes liquidity (buys/sells limit order) from the exchange. 
A maker order has to wait to be matched by either a taker order or by the matching engine. A taker order, on the other hand, does not need go onto a matching engine, but is instead immediately matched with a maker order.
TomoX integrates these two standard actors. Furthermore, because of the difference in their roles, trade fees for makers are lower than those of takers. 
For an order to be valid, it must be signed by a user using a private key associated with the user’s wallet address. Once an order is sent, a cryptographic hash of the order’s data is returned back to users’ wallet so that all historical and pending orders can be traced back by using the orders’ hash and Tomo Swarm.

### Order Serializer

Structured orders made by users through TomoX Web are serialized into byte streams and sent to Tomo Swarm, a decentralized storage system. Serializing data to transfer over the Internet is quite common in today’s applications.

### Tomo Swarm

As opposed to some existing decentralized exchanges such as IDEX where orders are saved in a centralized server, TomoX provides a decentralized order book through the decentralized storage Tomo Swarm. Tomo Swarm is a customized version of Ethereum Swarm made to fit with TomoChain’s masternode architecture. Tomo Swarm is run by all masternodes and candidates of the system. Therefore, an order stored in Tomo Swarm can be quickly received by and broadcast to all masternodes because of Tomo Swarm’s data transport protocol optimizations.

### Order deserializer

Order deserializer has the opposite semantics to Order serializer. Specifically, orders stored in byte streams in Tomo Swarm are deserialized into structured data, which are then saved to the decentralized order book database. 

### Decentralized order book database

TomoX not only provides a means for decentralizing order matching and execution, but also provides a decentralized order book. A decentralized order book stores exchange orders in a structured way (i.e. in relational or key-value database). Each masternode has a copy of the order book and this copy is off-chain. More importantly, replicating the orders in many masternodes makes it impossible to attack or corrupt the order book. The synchronization of orders is addressed by Tomo Swarm as previously described. 

### Matching engine

TomoX provides an off-chain matching engine, which is a common technique for increasing the performance characteristics in some existing DEXs built for Ethereum. One of the most significant advantages of CEX features compared to DEX features is the performance: a taker can trade instantly with an existing maker order and canceling a pending order is free. This is because all heavy operations such as order matching and execution are done off-chain.  
TomoX is a unique combination of off-chain matching, a decentralized order book database, PoSV consensus and exchange integration. With this unique combination, TomoX’s order confirmation will be almost instant, just as is provided by TomoChain’s PoSV.  
Generally speaking, for each trading pair TOMO/TokenX, the matching engine matches a buy order and a sell order with compatible price as follows:
Maker-taker matching: A maker-taker order pair is immediately matched if both the taker and matcher order are available. If there are multiple taker orders targeted at the same maker order, a first-in first-out strategy will be used.
Maker-maker matching: A buy order and a sell order are matched with each other if the maximum price of the buy order matches or exceeds the minimum price of the sell order. 
The output of the matching engine is a set of pairs of orders, or set of trades that will be executed by the order processor. 

### Order processor

As previously described and differing from most existing DEXs, i.e. for Ethereum, which are Layer 2 solutions, TomoX is directly integrated into the core consensus layer. Instead of relying on smart contracts, the order processor integrated into the core TomoChain layer can directly change the TOMO and TokenX balance of the buyer and seller. 
All tokens issued on TomoChain will conform to certain standards. Initially, TomoX will support TRC20 tokens, which are similar to ERC20 tokens but issued on TomoChain. More standards will then be gradually integrated into TomoX. In addition, TomoChain will also provide ICO templates along with token standards in order for business makers and start-ups to easily raise funds for their projects.
Once all trades are executed, a hash H of all the successfully executed trades is computed. The hash is the cryptographic hash of the matched orders information, including a list LT (list of trades) of executed trades [{O11, O12}, {O21, O22}, .., {On1, On2}], in which {Oi1, Oi2} is the two hashes of two matched and executed orders. At this point, all orders that have been executed by the order processor are available in Tomo Swarm. The list of executed trades LT is then pushed back to Tomo Swarm so that all other masternodes can verify the successfully executed orders. In addition, the hash of the LT is sent to an order settlement smart contract run on TomoChain by means of a settlement transaction. 

### Transaction processor

Transaction processor is the main component of TomoChain’s masternodes in charge of verifying transactions to include in a block. Ordinary transactions (Tomo transfer or smart contract call transaction) come to the mempool, and are then read by the Transaction processor. All processed transactions are then added to a block, which is verified by the network through PoSV (this is what is already being done in TomoChain at the moment).   

### Order settlement smart contract

Execution of matched orders need to be confirmed and settled through PoSV consensus. The settlement is done with an order settlement smart contract. In most existing decentralized exchanges, smart contracts have become a standard means of changing the token balance of traders. On the other hand, TomoChain’s order settlement smart contract is nicely combined with the decentralized storage Tomo Swarm. Specifically, the order settlement smart contract only stores the hash H of all successfully executed order pairs (LT) as previously described. Once the transaction reaches a masternode, the masternode can find all executed trades in Tomo Swarm through the hash H and re-execute the trades to verify the resulting balance of all buyers and sellers involved in the trades. 
Simplifying the semantics of the settlement smart contracts reduces a lot of storage requirements and time-consuming smart contract operations, thus increasing the performance of TomoX. In addition, only storing the hash of successfully executed trades lowers the security risks with smart contracts, which have been manipulated by attackers in the past, such as the DAO and Parity multi-signature wallet attacks.

## RELAYER AND MASTERNODES

As pointed out in the Section Introduction, building a decentralized exchange and operating it to provide enough liquidity are difficult in different aspects, including technicalities, marketing strategies and financial resources. TomoX Protocol addresses this problem by providing a Relayer-Masternode architecture. 

### Why do we need multiple relayers?

The rationale behind the Relayer-Masternode architecture is as follows - if there are thousands of tokens for trading and there is only one relayer, there are several problems:
Thousands of traded tokens on a relayer would make the exchange user interface/experience inefficient.
A single company would need substantial financial resources to market thousands of tokens to traders.
Because of differences in culture and geographic regions, traders from different regions have interest in different sets of tokens, thus requiring the decentralized exchange operator to have different marketing strategies for different geographical regions. 

### Advantages of Relayer-Masternode architecture

Instead of having a company create both a decentralized protocol and marketing it, the idea of Relayer-Masternode TomoX Protocol is to let many companies and/or decentralized business makers create their own relayers that target different sets of tokens. The relayers are responsible for providing liquidity and trading pairs for a specific set of tokens (initially TOMO/TokenX) for their target traders/users. The advantages of this Relayer-Masternode architecture are as follows:
All relayers interact with the standardized TomoX Protocol directly integrated into the core TomoChain layer. This means relayers do not need to utilise substantial funds building the underlying decentralized exchange protocol, thus significantly reducing development as well as maintenance costs.
All relayers can therefore focus on marketing and liquidity development.
A relayer intended for a specific geographical region market can optimize their marketing strategy towards trading pairs that are of interest to local traders. For example, a relayer in Hong Kong or Singapore would support a different set of tokens than those of a relayer in Africa.
A relayer can read maker orders for specific tokens from the decentralized order book of a masternode to enrich its liquidity. On the other hand, a relayer can host a matching engine and an order book for some specific tokens. The matching engine of the relayer can produce a set of matched orders from the relayer’s local order book. The matched orders are then sent to the masternode’s Tomo Swarm for finalizing the trade execution. Local matching engines of relayers can significantly reduce the computation load of masternodes’ matching engine. 
It is worth noting that the first Relayer will be TomoDEX, which is supported and operated by the TomoChain company. Later on, any company can claim to have their own relayer where users can trade a set of specific trading pairs (TOMO/TokenX).

### Incentives for Relayer operators

There is an incentive mechanism to encourage exchange operators to form relayers. One incentive is that masternodes do their computation for order matching and trade execution. Another incentive is that relayers’ operators can focus on regional marketing strategies to attract traders and have local matching engines and order books. We believe that there should be an incentive mechanism distributing trading fees to masternodes and relayers. For example, a 50/50 sharing ratio between a masternode and a relayer would be a reasonable option. However, this ratio is not hard-coded and can be negotiated between masternodes and relayers. 
We believe that this Relayer-Masternode architecture will gradually build up a strong relayer-based decentralized exchange around TomoChain’s masternode architecture, which again strengthens the TomoChain ecosystem and token economy that we aim to achieve. 

## TOMOX PROTOCOL SUMMARY

-   Performance: TomoX Protocol is integrated into the core TomoChain blockchain consensus layer which can potentially handle many thousands of transactions per second. Furthermore, with the Relayer-Masternode architecture, the heavy computational load of the matching engine in masternodes can be substantially moved to Relayers’ local matching engine. Performance of the TomoX Protocol can therefore potentially be an improvement when compared to most of the existing DEXs.
-   Liquidity: This is a chicken and egg problem. Traders do not join most of the existing DEXs because there are not enough orders on these DEXs to match. We believe that with the Relayer-Masternode architecture, each relayer can focus on understanding their relevant markets and trading pairs - thus the potential for better and targeted marketing strategies to attract more traders to participate in the ecosystem.
-   Full decentralization: Most of the existing DEXs are semi-decentralized. For example, IDEX requires traders to deposit their tokens to their centralized server and all orders are stored on this centralized server. Even though the traders still have full control of their assets (because the centralized server does not know the private keys of traders), there is still a single point of failure - the centralized server. If the server is attacked, all orders can be lost. Alternatively, if the server is corrupted, it can do front-running attacks since it controls how orders are matched. TomoX Protocol, on the other hand, is fully decentralized because the order book database, matching engine and trade execution mechanism are decentralized to all masternodes. As a result of this decentralization power in TomoX, we believe this can significantly reduce front-running risks that currently appear in some centralized exchanges or semi-decentralized exchanges. 
-   Security: As previously described, centralized exchanges have some safety and security problems. These problems have resulted in some of the biggest attacks such as MtGox and Bitfinex where 850,000 BTC in 2014 and 120,000 BTC in 2016, respectively, were stolen. These attacks happened and were successful because of the single point of failure problem in centralized exchanges, and the fact that traders on centralized exchanges do not have control of their private keys.  TomoX and decentralized exchanges generally solve this problem because the users have complete control of their assets. However, while some DEXs require traders to deposit their assets, TomoX does not impose this requirement on traders, which is an advantage of TomoX over other DEXs. 
-   Cost: TomoChain provides near-zero transaction fees, which significantly reduces trading fees compared to most existing DEXs.
-   Interoperability: TomoX will support cross-chain exchanges so that traders can interact with and exchange other native tokens of other blockchain infrastructures - such as ETH and BTC. Atomic Swap techniques will be used for improving interoperability.
-   Accessibility: Fiat integration has been missing in most existing DEXs. While TomoX Protocol does not directly support exchanges between fiat currencies and cryptocurrencies, Relayers have the potential to provide this service. 
